local packer = require("packer")

vim.api.nvim_create_augroup("packer_auto_reload", {})
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "packer_auto_reload",
  pattern = "plugins.lua",
  command = "source <afile> | PackerSync",
})

packer.init {
  package_root = vim.fn.stdpath("config") .. "/pack",
  -- use a floating window
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
}

packer.startup(function(use)
  -- self-manage
  use "wbthomason/packer.nvim"

  use "kaicataldo/material.vim"
  use "rebelot/kanagawa.nvim"
  use "folke/tokyonight.nvim"

  use "tpope/vim-surround"
  use "tpope/vim-repeat"
  use "tpope/vim-commentary"

  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  }

  use {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    }
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
    },
  }
end)
