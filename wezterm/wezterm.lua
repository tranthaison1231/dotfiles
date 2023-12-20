local wezterm = require("wezterm")

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.color_scheme = "Dracula"
config.font = wezterm.font("Fira Code", { weight = "Medium" })
config.font_size = 14
config.window_decorations = "RESIZE"
config.status_update_interval = 1000
config.enable_kitty_graphics = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- Config tab_bar
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.colors = {
	tab_bar = {
		background = "#282a36",
		active_tab = {
			bg_color = "#44475A",
			fg_color = "#f8f8f2",
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "#282a36",
			fg_color = "#f8f8f2",
		},
	},
}

return config
