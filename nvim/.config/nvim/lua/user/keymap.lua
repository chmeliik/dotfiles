local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent=true })
end

-- use <Space> as leader key
vim.g.mapleader = " "

map("n", "<C-j>", ":bnext<CR>")
map("n", "<C-k>", ":bprev<CR>")

map("n", "<Leader>e", ":Lexplore 20<CR>")
