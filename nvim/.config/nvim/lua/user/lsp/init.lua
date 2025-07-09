---@type table<string, vim.lsp.Config>
local servers = {
  -- Lua
  lua_ls = {
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
  },
  -- Python
  pyright = {},
  ruff = {
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
    on_attach = function(client, _)
      client.server_capabilities.hoverProvider = false
    end,
  },
  -- Rust
  rust_analyzer = {},
  -- Go
  gopls = {},
  -- Haskell
  hls = {},
  -- JS/TS
  ts_ls = {},
  -- Bash
  bashls = {},
  -- Markdown
  marksman = {},
  -- JSON
  jsonls = {},
}

for server, config in pairs(servers) do
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end

local servers_to_install = vim.tbl_filter(function(name)
  -- Manually manage haskell-language-server via ghcup
  return name ~= "hls"
end, vim.tbl_keys(servers))

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers_to_install,
  automatic_enable = false,
})

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
