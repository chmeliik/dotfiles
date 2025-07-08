require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = { exclude = { "hls" } },
})

local setup_server = require("user.lsp.machinery").setup_server
local null_ls_register = require("user.lsp.machinery").null_ls_register

--#region servers

-- Lua
setup_server("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { -- s, t, i are injected by LuaSnip into snippet files
        globals = { "s", "t", "i" },
      },
      workspace = {
        checkThirdParty = false,
      },
    },
  },
})

null_ls_register("stylua", "formatting")

-- Python
setup_server("pyright")
setup_server("ruff", {
  init_options = {
    settings = {
      lint = {
        extendIgnore = {
          -- line-too-long
          "E501",
        },
      },
    },
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.hoverProvider = false
  end,
})

-- Rust
setup_server("rust_analyzer")

-- Go
setup_server("gopls")

-- Haskell
setup_server("hls")

-- JS/TS
setup_server("ts_ls")

-- Bash
setup_server("bashls")

-- Markdown
setup_server("marksman")

null_ls_register("markdownlint", { "formatting", "diagnostics" })
null_ls_register("write_good", "diagnostics")

-- JSON
setup_server("jsonls")

--#endregion servers

require("null-ls").setup({ on_attach = on_attach })
require("mason-null-ls").setup({
  ensure_installed = { "shellcheck" }, -- for bash-language-server
  automatic_installation = true,
})
