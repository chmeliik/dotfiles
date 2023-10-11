local lazy = require("lazy")

local plugins = {}

---@param plugin_spec LazySpec
local function use(plugin_spec)
  table.insert(plugins, { plugin_spec })
end

use("kaicataldo/material.vim")
use("rebelot/kanagawa.nvim")
use("folke/tokyonight.nvim")

use("tpope/vim-surround")
use("tpope/vim-repeat")
use("tpope/vim-commentary")

use({
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdateSync",
})

use({
  "nvim-telescope/telescope.nvim",
  version = "0.1.*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
})

use("stevearc/dressing.nvim")

use({ "L3MON4D3/LuaSnip", version = "2.*" })
use("rafamadriz/friendly-snippets")

use({
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
  },
})

use("windwp/nvim-autopairs")

use("williamboman/mason.nvim")
use("williamboman/mason-lspconfig.nvim")
use("jay-babu/mason-null-ls.nvim")

use("neovim/nvim-lspconfig")

use({
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
})

use("folke/neodev.nvim")

lazy.setup(plugins)
