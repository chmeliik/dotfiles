require("nvim-treesitter.configs").setup {
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "make", "help" },
  },
  indent = {
    enable = true,
    disable = { "python" },
  },
}
