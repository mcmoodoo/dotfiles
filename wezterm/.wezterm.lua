local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Dracula'
config.enable_wayland = true
config.window_background_opacity = 0.85
config.enable_wayland = false

return config
