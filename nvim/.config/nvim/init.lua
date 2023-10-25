require("user.opts")
require("user.keymap")
require("user.filetype")

local try = require("user.lib").try

try(require, "user.plugins")

try(require, "user.colorscheme")
try(require, "user.telescope")
try(require, "user.treesitter")
try(require, "user.ssr")
try(require, "user.completion")
try(require, "user.lsp")
