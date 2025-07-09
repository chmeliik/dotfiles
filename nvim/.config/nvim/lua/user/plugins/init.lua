return {
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-commentary",

  "stevearc/dressing.nvim",

  {
    "echasnovski/mini.align",
    version = "*",
    config = function()
      require("mini.align").setup()
    end,
  },
}
