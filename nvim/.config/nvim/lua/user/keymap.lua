local map = require("user.lib").map
local mkfn = require("user.lib").mkfn

-- use <Space> as leader key
vim.g.mapleader = " "

map("n", "<C-j>", ":bnext<CR>")
map("n", "<C-k>", ":bprev<CR>")

map("n", "<Leader>E", ":Lexplore 20<CR>")

map("n", "<Leader>e", vim.diagnostic.open_float)
map("n", "[d", mkfn(vim.diagnostic.jump, { count = -1, float = true }))
map("n", "]d", mkfn(vim.diagnostic.jump, { count = 1, float = true }))
map("n", "<Leader>q", vim.diagnostic.setloclist)

map("n", "<A-k>", vim.lsp.buf.signature_help)
map("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder)
map("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder)
map("n", "<Leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)
map("n", "<Leader>rn", vim.lsp.buf.rename)
map("n", "<Leader>ca", vim.lsp.buf.code_action)
map("n", "<Leader>F", function()
  vim.lsp.buf.format({ async = true })
end)
