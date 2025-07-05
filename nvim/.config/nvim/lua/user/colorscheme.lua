local function kanagawa()
  require("kanagawa").setup({
    transparent = true,
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
          },
        },
      },
    },
  })
end

kanagawa()

vim.cmd("colorscheme kanagawa")
