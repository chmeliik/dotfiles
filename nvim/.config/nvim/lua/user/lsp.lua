require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
})

local map = require("user.lib").map
local telescope_builtin = require("telescope.builtin")

map("n", "<Leader>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<Leader>q", function()
  telescope_builtin.diagnostics({ bufnr = 0 })
end)

local function on_attach(_, bufnr)
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
end

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function setup(server_name, settings)
  lspconfig[server_name].setup({
    settings = settings or {},
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

setup("sumneko_lua", {
  Lua = {
    diagnostics = {
      -- s, t, i are injected by LuaSnip into snippet files
      globals = { "vim", "s", "t", "i" },
    },
  },
})

setup("pyright")

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.write_good,
  },
  on_attach = on_attach,
})
