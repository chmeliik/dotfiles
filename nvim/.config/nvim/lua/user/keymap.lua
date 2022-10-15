local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent=true })
end

-- use <Space> as leader key
vim.g.mapleader = " "

map("n", "<C-j>", ":bnext<CR>")
map("n", "<C-k>", ":bprev<CR>")

map("n", "<Leader>e", ":Lexplore 20<CR>")

local telescope_builtin = require("telescope.builtin")
map("n", "<Leader>fd", telescope_builtin.find_files)
map("n", "<Leader>rg", telescope_builtin.live_grep)
map("n", "<Leader>*", telescope_builtin.grep_string)
map("n", "<Leader>ls", telescope_builtin.buffers)
map("n", "<Leader>R", telescope_builtin.command_history)
map("n", "<Leader>T", telescope_builtin.builtin)
