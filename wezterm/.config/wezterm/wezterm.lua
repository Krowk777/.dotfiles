local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Macchiato"
config.text_background_opacity = 0.90
config.window_background_opacity = 0.80
config.initial_cols = 160
config.initial_rows = 48

config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 11

config.enable_tab_bar = false
config.window_decorations = "NONE"

config.enable_wayland = false

return config
