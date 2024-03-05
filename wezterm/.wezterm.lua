local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'CaskaydiaMono Nerd Font Mono'
config.color_scheme = 'nord'
config.enable_tab_bar = false

return config
