local lib = {}

function lib.map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

function lib.try(fn, ...)
  local ok, err = pcall(fn, ...)
  if not ok then
    vim.notify(err, vim.log.levels.WARN)
  end
end

return lib
