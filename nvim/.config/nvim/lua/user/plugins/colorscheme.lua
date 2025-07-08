return {
  -- This is the main colorscheme
  "rebelot/kanagawa.nvim",
  -- See https://lazy.folke.io/spec/examples
  lazy = false,
  priority = 1000,
  config = function()
    -- For some reason, setting the options via the Lazy 'opts' argument
    -- breaks transparency. Set the options here instead.
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
    vim.cmd("colorscheme kanagawa")
  end,
}
