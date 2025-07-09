local lib = {}

---@param mode string|table
---@param lhs string
---@param rhs string|function
function lib.map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

return lib
