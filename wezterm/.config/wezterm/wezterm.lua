local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Color's
config.color_scheme = "Catppuccin Mocha"

-- Font
config.font = wezterm.font("JetBrains Mono")
config.font_size = 20

-- Padding
config.window_padding = {
	left = 0,
	right = 0,
	top = 4,
	bottom = 0,
}

-- Tabs
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Split's
local act = wezterm.action
config.keys = {
	{
		key = "\\",
		mods = "CMD|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "\\",
		mods = "CMD",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = "CMD",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "z",
		mods = "CMD",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "LeftArrow",
		mods = "CMD",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CMD",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CMD",
		action = act.ActivatePaneDirection("Down"),
	},

	{
		key = "h",
		mods = "CMD",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CMD",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CMD",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CMD",
		action = act.ActivatePaneDirection("Down"),
	},
}

return config
