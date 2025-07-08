return {
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-commentary",

  "stevearc/dressing.nvim",

  { "mason-org/mason.nvim" },
  { "mason-org/mason-lspconfig.nvim" },
  "jay-babu/mason-null-ls.nvim",

  "neovim/nvim-lspconfig",

  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "echasnovski/mini.align",
    version = "*",
    config = function()
      require("mini.align").setup()
    end,
  },
}
