return {
  "neovim/nvim-lspconfig",

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
    },
    config = function()
      local servers = require("user.lsp.servers")
      local servers_to_install = vim.tbl_filter(function(name)
        -- Manually manage haskell-language-server via ghcup
        return name ~= "hls"
      end, vim.tbl_keys(servers))

      require("mason-lspconfig").setup({
        ensure_installed = servers_to_install,
        automatic_enable = false,
      })
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.markdownlint,
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.diagnostics.write_good,
        },
      })

      require("mason-null-ls").setup({
        ensure_installed = {
          "shellcheck", -- for bash-language-server
          "stylua",
          "markdownlint",
          "write_good",
        },
        automatic_installation = false,
      })
    end,
  },
}
