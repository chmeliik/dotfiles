local map = require("user.lib").map

-- use <Space> as leader key
vim.g.mapleader = " "

map("n", "<C-j>", ":bnext<CR>")
map("n", "<C-k>", ":bprev<CR>")

map("n", "<Leader>E", ":Lexplore 20<CR>")
