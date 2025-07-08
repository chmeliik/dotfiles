require("user.opts")
require("user.keymap")
require("user.filetype")

local try = require("user.lib").try

local ok, lazy = pcall(require, "lazy")
if ok then
  lazy.setup("user.plugins")
else
  local error = tostring(lazy)
  vim.notify(error, vim.log.levels.ERROR)
end

try(require, "user.ssr")
try(require, "user.completion")
try(require, "user.lsp")
