local wezterm = require("wezterm")

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.color_scheme = "Dracula"
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })
config.font_size = 14
config.window_decorations = "RESIZE"

config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.tab_bar_at_bottom = false

return config
