local map = require("user.lib").map
local mkfn = require("user.lib").mkfn

-- use <Space> as leader key
vim.g.mapleader = " "

map("n", "<C-j>", ":bnext<CR>")
map("n", "<C-k>", ":bprev<CR>")

map("n", "<Leader>E", ":Lexplore 20<CR>")

map("n", "<Leader>e", vim.diagnostic.open_float)
map("n", "[d", mkfn(vim.diagnostic.jump, { count = 1, float = true }))
map("n", "]d", mkfn(vim.diagnostic.jump, { count = -1, float = true }))
map("n", "<Leader>q", vim.diagnostic.setloclist)
