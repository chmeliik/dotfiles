local function material()
  vim.g.material_terminal_italics = true
  vim.g.material_theme_style = "ocean"
end

local function kanagawa()
  require("kanagawa").setup({ transparent = true })
end

local function tokyonight()
  require("tokyonight").setup({
    style = "night",
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  })
end

material()
kanagawa()
tokyonight()

vim.cmd("colorscheme kanagawa")
