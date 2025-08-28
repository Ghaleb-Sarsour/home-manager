-- Importing wezterm api
local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Options:

config.color_scheme = "Moonfly (Gogh)" 

config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 20

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.9

config.enable_wayland = true


-- Return config
return config
