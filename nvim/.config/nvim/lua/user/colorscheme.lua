local colorschemes = {
  material = function()
    vim.g.material_terminal_italics = true
    vim.g.material_theme_style = "ocean"
    vim.cmd("colorscheme material")
  end,
}

local function set(name)
  local set_colorscheme = colorschemes[name]
  if not set_colorscheme then
    error("no such colorscheme: " .. name)
  end
  set_colorscheme()
end

return {
  set = set,
}
