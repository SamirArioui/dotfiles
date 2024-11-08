-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = "catppuccin-mocha"
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 18
return config
