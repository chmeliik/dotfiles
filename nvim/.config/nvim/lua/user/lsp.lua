require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function setup(server_name, settings)
  lspconfig[server_name].setup({
    settings = settings or {},
    capabilities = capabilities,
  })
end

setup("sumneko_lua", {
  Lua = {
    diagnostics = {
      disable = { "need-check-nil" },
      -- s, t, i are injected by LuaSnip into snippet files
      globals = { "vim", "s", "t", "i" },
    },
  },
})

setup("pyright")
