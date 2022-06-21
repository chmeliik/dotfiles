local wezterm = require 'wezterm'

return {
  color_scheme = "MaterialOcean",

  font = wezterm.font_with_fallback({
    "JetBrains Mono",
    "Symbola",  -- has the ⇡ and ⇣ glyphs
  }),

  window_decorations = "NONE",
  window_background_opacity = 0.9,

  inactive_pane_hsb = {
    brightness = 0.5,
  },

  clean_exit_codes = {130},

  mouse_bindings = {
    -- Left click only selects text and doesn't open hyperlinks
    {
      event={Up={streak=1, button="Left"}},
      mods="NONE",
      action=wezterm.action{CompleteSelection="PrimarySelection"},
    },
    -- CTRL-Click opens hyperlinks
    {event={Up={streak=1, button="Left"}}, mods="CTRL", action="OpenLinkAtMouseCursor"},
    {event={Down={streak=1, button="Left"}}, mods="CTRL", action="Nop"},
  },

  keys = {
    {key="UpArrow", mods="SHIFT", action=wezterm.action{ScrollByLine=-1}},
    {key="DownArrow", mods="SHIFT", action=wezterm.action{ScrollByLine=1}},
  },
}
