---@type table<string, vim.lsp.Config>
return {
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
