require("mason").setup()
require("mason-lspconfig").setup({ automatic_installation = true })

require("neodev").setup()

local setup_server = require("user.lsp.machinery").setup_server
local null_ls_register = require("user.lsp.machinery").null_ls_register
local on_attach = require("user.lsp.machinery").on_attach

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
setup_server("ruff_lsp", {
  init_options = {
    settings = {
      -- line-too-long
      args = { "--ignore=E501" },
    },
  },
  on_attach = function(client, bufnr)
    on_attach(client, bufnr, { hoverProvider = false })
  end,
})

null_ls_register("black", "formatting")
null_ls_register("ruff", "formatting", { extra_args = { "--select=I" } })

-- Rust
setup_server("rust_analyzer")

-- Go
setup_server("gopls")

-- Markdown
null_ls_register("markdownlint", { "formatting", "diagnostics" })
null_ls_register("write_good", "diagnostics")

--#endregion servers

require("null-ls").setup({ on_attach = on_attach })
require("mason-null-ls").setup({ automatic_installation = true })
