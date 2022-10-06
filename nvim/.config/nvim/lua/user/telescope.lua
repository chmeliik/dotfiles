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
