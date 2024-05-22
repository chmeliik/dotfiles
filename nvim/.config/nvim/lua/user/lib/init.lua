local lib = {}

---@param mode string|table
---@param lhs string
---@param rhs string|function
function lib.map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

---@param fn function
---@param ... any
function lib.try(fn, ...)
  local ok, err = pcall(fn, ...)
  if not ok then
    vim.notify(err, vim.log.levels.WARN)
  end
end

---@param fn function
---@param ... any
function lib.mkfn(fn, ...)
  local args = { ... }
  return function()
    fn(table.unpack(args))
  end
end

return lib
