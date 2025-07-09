return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdateSync",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      ensure_installed = {
        -- https://codecompanion.olimorris.dev/installation.html#installation
        "markdown",
        "markdown_inline",
      },
      highlight = {
        enable = true,
        disable = { "make", "markdown", "gitcommit", "vim" },
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
        is_supported = function()
          local mode = vim.api.nvim_get_mode()
          return mode.mode ~= "c"
        end,
      },
    })
  end,
}
