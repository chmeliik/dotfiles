local map = require("user.lib").map
local telescope_builtin = require("telescope.builtin")

map("n", "<Leader>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<Leader>q", function()
  telescope_builtin.diagnostics({ bufnr = 0 })
end)

local function on_attach(client, bufnr, override_capabilities)
  local function bufmap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr })
  end

  bufmap("n", "gd", telescope_builtin.lsp_definitions)
  bufmap("n", "gD", telescope_builtin.lsp_type_definitions)
  bufmap("n", "gi", telescope_builtin.lsp_implementations)
  bufmap("n", "gr", telescope_builtin.lsp_references)
  bufmap("n", "<Leader>D", vim.lsp.buf.declaration)

  bufmap("n", "K", vim.lsp.buf.hover)
  bufmap("n", "<A-k>", vim.lsp.buf.signature_help)

  bufmap("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder)
  bufmap("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder)
  bufmap("n", "<Leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workLeader_folders()))
  end)

  bufmap("n", "<Leader>rn", vim.lsp.buf.rename)
  bufmap("n", "<Leader>ca", vim.lsp.buf.code_action)
  bufmap("n", "<Leader>F", function()
    vim.lsp.buf.format({ async = true })
  end)

  local server_capabilities = vim.tbl_deep_extend(
    "force",
    client.server_capabilities,
    override_capabilities or {}
  )
  client.server_capabilities = server_capabilities
end

require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
})

local function setup(server_name, settings, override_capabilities)
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  lspconfig[server_name].setup({
    settings = settings or {},
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      on_attach(client, bufnr, override_capabilities)
    end,
  })
end

setup("lua_ls", {
  Lua = {
    diagnostics = { -- s, t, i are injected by LuaSnip into snippet files
      globals = { "vim", "s", "t", "i" },
    },
    workspace = {
      checkThirdParty = false,
    },
  },
})

setup("pyright")
setup("ruff_lsp", {}, { hoverProvider = false })

setup("rust_analyzer")

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.ruff,
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.write_good,
  },
  on_attach = on_attach,
})

-- unlike mason-lspconfig, mason-null-ls needs to be called *after* setting up sources
require("mason-null-ls").setup({ automatic_installation = true })
