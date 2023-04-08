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
local telescope_builtin = require("telescope.builtin")

map("n", "<Leader>fd", telescope_builtin.find_files)
map("n", "<Leader>rg", telescope_builtin.live_grep)
map("n", "<Leader>*", telescope_builtin.grep_string)
map("n", "<Leader>ls", telescope_builtin.buffers)
map("n", "<Leader>R", telescope_builtin.command_history)
map("n", "<Leader>T", telescope_builtin.builtin)
map("n", "<Leader>q", function()
  telescope_builtin.diagnostics({ bufnr = 0 })
end)
