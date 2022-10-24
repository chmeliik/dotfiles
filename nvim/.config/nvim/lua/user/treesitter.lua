require("nvim-treesitter.configs").setup({
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "make", "help", "markdown" },
  },
  indent = {
    enable = true,
    disable = { "python" },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<CR>",
      node_incremental = "<Tab>",
      node_decremental = "<S-Tab>",
    },
  },
})
