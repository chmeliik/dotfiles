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

  {
    "smjonas/live-command.nvim",
    config = function()
      require("live-command").setup({
        commands = {
          Norm = { cmd = "norm" },
        },
      })
    end,
  },
}
