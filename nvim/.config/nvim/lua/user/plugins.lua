local function setup()
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

    use { "kaicataldo/material.vim", event = "ColorSchemePre", cmd = "material" }

    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "tpope/vim-commentary"

    use {
      "nvim-treesitter/nvim-treesitter",
      run = function()
        require("nvim-treesitter.install").update({ with_sync = true })
      end,
    }
  end)
end

return {
  setup = setup,
}