local telescope_builtin = require("telescope.builtin")

local M = {}

---@param client any
---@param bufnr integer
---@param override_capabilities table?
function M.on_attach(client, bufnr, override_capabilities)
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
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
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

---@param server_name string
---@param args table<string, any>?
function M.setup_server(server_name, args)
  args = vim.tbl_deep_extend("keep", args or {}, {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = M.on_attach,
  })
  require("lspconfig")[server_name].setup(args)
end

---@alias null_ls_method
---| "hover"
---| "completion"
---| "formatting"
---| "diagnostics"
---| "code_action"

---@param tool_name string
---@param methods null_ls_method | null_ls_method[]
---@param with table<string, any>?
function M.null_ls_register(tool_name, methods, with)
  local null_ls = require("null-ls")

  if type(methods) == "string" then
    methods = { methods }
  end

  for _, method in pairs(methods) do
    local tool = null_ls.builtins[method][tool_name]
    if with ~= nil then
      tool = tool.with(with)
    end
    null_ls.register(tool)
  end
end

return M
