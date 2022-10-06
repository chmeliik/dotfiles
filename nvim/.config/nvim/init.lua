require("user.opts")
require("user.keymap")

pcall(require("user.plugins").setup)
pcall(require("user.treesitter").setup)
pcall(require("user.telescope").setup)
pcall(require("user.colorscheme").set, "material")
