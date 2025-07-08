return {
  "rebelot/kanagawa.nvim",

  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-commentary",

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdateSync",
  },

  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },

  "stevearc/dressing.nvim",

  {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    dependencies = { "rafamadriz/friendly-snippets" },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },

  "windwp/nvim-autopairs",

  { "mason-org/mason.nvim" },
  { "mason-org/mason-lspconfig.nvim" },
  "jay-babu/mason-null-ls.nvim",

  "neovim/nvim-lspconfig",

  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  { "folke/lazydev.nvim", ft = "lua", opts = {} },

  "cshuaimin/ssr.nvim",

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
