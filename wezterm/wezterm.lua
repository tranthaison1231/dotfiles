local wezterm = require("wezterm")

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.font = wezterm.font("FiraCode Nerd Font", { weight = "Medium" })
config.font_size = 14
config.window_decorations = "RESIZE"
config.status_update_interval = 1000
config.enable_kitty_graphics = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.native_macos_fullscreen_mode = true

-- Config tab_bar
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"

-- Config Theme Color
config.colors = {
	foreground = "#f8f8f2",
	-- The default background color
	background = "#282a36",

	-- Overrides the cell background color when the current cell is occupied by the
	-- cursor and the cursor style is set to Block
	cursor_bg = "#f8f8f2",
	-- Overrides the text color when the current cell is occupied by the cursor
	cursor_fg = "#282a36",
	-- Specifies the border color of the cursor when the cursor style is set to Block,
	-- or the color of the vertical or horizontal bar when the cursor style is set to
	-- Bar or Underline.
	cursor_border = "#f8f8f2",

	-- the foreground color of selected text
	selection_fg = "none",
	-- the background color of selected text
	selection_bg = "rgba(68,71,90,0.5)",

	-- The color of the scrollbar "thumb"; the portion that represents the current viewport
	scrollbar_thumb = "#44475a",

	-- The color of the split lines between panes
	split = "#6272a4",

	ansi = { "#21222C", "#FF5555", "#50FA7B", "#F1FA8C", "#BD93F9", "#FF79C6", "#8BE9FD", "#F8F8F2" },
	brights = { "#6272A4", "#FF6E6E", "#69FF94", "#FFFFA5", "#D6ACFF", "#FF92DF", "#A4FFFF", "#FFFFFF" },
	tab_bar = {
		background = "#282a36",
		active_tab = {
			bg_color = "#bd93f9",
			fg_color = "#282a36",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#282a36",
			fg_color = "#f8f8f2",
		},
		inactive_tab_hover = {
			bg_color = "#6272a4",
			fg_color = "#f8f8f2",
			italic = true,
		},
		new_tab = {
			bg_color = "#282a36",
			fg_color = "#f8f8f2",
		},
		new_tab_hover = {
			bg_color = "#ff79c6",
			fg_color = "#f8f8f2",
			italic = true,
		},
	},
}

return config
