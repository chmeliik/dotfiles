require("user.opts")
require("user.keymap")

-- auto-reload config files
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "init.lua,lua/user/*.lua",
    command = "source <afile>",
})

vim.cmd("source ~/.config/nvim/themes/material.vim")
