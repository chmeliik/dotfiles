local telescope = require("telescope")

telescope.setup({
  defaults = {
    layout_config = {
      horizontal = {
        preview_cutoff = 0,
      },
    },
  },
})

telescope.load_extension("fzf")

local map = require("user.lib").map
local mkfn = require("user.lib").mkfn
local telescope_builtin = require("telescope.builtin")

local files_opts = {
  find_command = { "rg", "--files", "--color=never", "--hidden", "--glob=!.git" },
}

local grep_opts = {
  additional_args = { "--hidden", "--glob=!.git" },
}

map("n", "<Leader>fd", mkfn(telescope_builtin.find_files, files_opts))
map("n", "<Leader>rg", mkfn(telescope_builtin.live_grep, grep_opts))
map("n", "<Leader>*", mkfn(telescope_builtin.grep_string, grep_opts))
map("n", "<Leader>ls", telescope_builtin.buffers)
map("n", "<Leader>R", telescope_builtin.command_history)
map("n", "<Leader>T", telescope_builtin.builtin)
-- all buffers
map("n", "<Leader>Q", telescope_builtin.diagnostics)
-- current buffer
map("n", "<Leader>q", mkfn(telescope_builtin.diagnostics, { bufnr = 0 }))
