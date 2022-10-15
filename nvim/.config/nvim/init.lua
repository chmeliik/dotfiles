require("user.opts")
require("user.keymap")
require("user.indentation")

local try = require("user.lib").try

try(require, "user.plugins")

try(require, "user.colorscheme")
try(require, "user.telescope")
try(require, "user.treesitter")
try(require, "user.completion")
