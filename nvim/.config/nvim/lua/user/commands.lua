vim.api.nvim_create_user_command("DockerDigest", function(opts)
  local ref, start_line, start_col, end_line, end_col

  if opts.range > 0 then
    local sp = vim.fn.getpos("'<")
    local ep = vim.fn.getpos("'>")
    start_line, start_col = sp[2] - 1, sp[3] - 1
    end_line, end_col = ep[2] - 1, ep[3]
    ref = table.concat(
      vim.api.nvim_buf_get_text(0, start_line, start_col, end_line, end_col, {})
    )
  else
    ref = vim.fn.expand("<cWORD>")
    local cursor = vim.api.nvim_win_get_cursor(0)
    local line = vim.api.nvim_get_current_line()
    local pos = cursor[2] + 1
    local word_start, word_end = pos, pos

    while word_start > 1 and line:sub(word_start - 1, word_start - 1):match("%S") do
      word_start = word_start - 1
    end

    while word_end <= #line and line:sub(word_end, word_end):match("%S") do
      word_end = word_end + 1
    end

    start_line = cursor[1] - 1
    end_line = start_line
    start_col = word_start - 1
    end_col = word_end - 1
  end

  if ref:match("@sha256:") then
    return vim.notify("Already has digest", vim.log.levels.INFO)
  end

  local cmd = string.format(
    "skopeo inspect --raw docker://%s | sha256sum",
    vim.fn.shellescape(ref)
  )
  local digest = vim.fn.system(cmd):match("^(%x+)")

  if not digest then
    vim.notify("Failed to get digest", vim.log.levels.ERROR)
    return
  end

  vim.api.nvim_buf_set_text(
    0,
    start_line,
    start_col,
    end_line,
    end_col,
    { ref .. "@sha256:" .. digest }
  )
  vim.notify("Added digest", vim.log.levels.INFO)
end, { range = true, desc = "Append Docker image digest" })
