-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- Font config
config.font = wezterm.font({
	family = "Dank Mono",
	harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
})
config.font_size = 17.0

-- Color config
config.colors = {
	-- The default text color
	foreground = "#e1e2ea",
	-- The default background color
	background = "#2b2b40",

	-- Overrides the cell background color when the current cell is occupied by the
	-- cursor and the cursor style is set to Block
	cursor_bg = "#99c7ab",
	-- Overrides the text color when the current cell is occupied by the cursor
	cursor_fg = "#2d2b44",
	-- Specifies the border color of the cursor when the cursor style is set to Block,
	-- or the color of the vertical or horizontal bar when the cursor style is set to
	-- Bar or Underline.
	cursor_border = "#99c7ab",

	-- the foreground color of selected text
	selection_fg = "2d2b44",
	-- the background color of selected text
	selection_bg = "#e2e1ea",

	-- The color of the scrollbar "thumb"; the portion that represents the current viewport
	scrollbar_thumb = "#222222",

	-- The color of the split lines between panes
	split = "#444444",

	ansi = {
		"#161622",
		"#d08092",
		"#99c7ab",
		"#e5aa8a",
		"#98aedd",
		"#b08cc5",
		"#80bfd1",
		"#e1e2ea",
	},
	brights = {
		"#6e6e7e",
		"#d897a5",
		"#a6ceb5",
		"#dacd8b",
		"#5678c2",
		"#c28ecd",
		"#90c5b5",
		"#e1e2ea",
	},
}

-- Tab bar
config.enable_tab_bar = false

-- Window padding
config.window_padding = {
	left = "0",
	right = "0",
	top = "0",
	bottom = "0",
}

-- Start tmux by default
config.default_prog = {
	"/sbin/zsh",
	"-c",
	"-l",
	"tmux attach || tmux",
}

config.warn_about_missing_glyphs = false

-- and finally, return the configuration to wezterm
return config
