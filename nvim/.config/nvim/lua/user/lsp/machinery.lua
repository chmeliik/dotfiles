local M = {}

---@param client any
---@param bufnr integer
---@param override_capabilities table?
function M.on_attach(client, bufnr, override_capabilities)
  local function bufmap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr })
  end

  bufmap("n", "K", vim.lsp.buf.hover)

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
  vim.lsp.config(server_name, args)
  vim.lsp.enable(server_name)
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
