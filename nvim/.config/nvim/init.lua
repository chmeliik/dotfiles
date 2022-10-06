require("user.opts")
require("user.keymap")
require("user.indentation")

pcall(require, "user.plugins")

pcall(require, "user.colorscheme")
pcall(require, "user.telescope")
pcall(require, "user.treesitter")
