require("user.opts")
require("user.keymap")
require("user.filetype")
require("user.lsp")

local ok, lazy = pcall(require, "lazy")
if ok then
  lazy.setup("user.plugins")
else
  local error = tostring(lazy)
  vim.notify(error, vim.log.levels.ERROR)
end
