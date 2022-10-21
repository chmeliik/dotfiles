vim.api.nvim_create_augroup("filetype_indent", {})

local function indent(language, how)
  vim.api.nvim_create_autocmd("FileType", {
    group = "filetype_indent",
    pattern = language,
    callback = how,
  })
end

local function spaces(n)
  return function()
    vim.opt_local.shiftwidth = n
  end
end

local function tabs(width)
  return function()
    vim.opt_local.tabstop = width or 8
    vim.opt_local.shiftwidth = 0
    vim.opt_local.expandtab = false
  end
end

indent("go", tabs(4))
indent("make", tabs(4))

indent("json", spaces(2))
indent("lua", spaces(2))
indent("xml", spaces(2))
indent("yaml", spaces(2))
indent("markdown", spaces(2))
