require("user.opts")
require("user.keymap")
require("user.indentation")

pcall(require("user.plugins").setup)
pcall(require("user.treesitter").setup)
pcall(require("user.telescope").setup)
pcall(require("user.colorscheme").set, "material")
