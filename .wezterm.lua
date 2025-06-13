-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.front_end = "OpenGL"
config.max_fps = 144
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500
config.term = "xterm-256color" -- Set the terminal type

config.font = wezterm.font("JetBrainsMono")
config.cell_width = 0.9
config.window_background_opacity = 0.7
config.prefer_egl = true
config.font_size = 12.0

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

-- scrollbar
-- config.enable_scroll_bar = true

-- tabs
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false


-- keymaps
config.keys = {
	-- Tabs
	{
		key = 'T',
		mods = 'CTRL|SHIFT|ALT',
		action = act.SpawnTab 'DefaultDomain',
	},
	{
		key = 'Q',
		mods = 'CTRL|SHIFT|ALT',
		action = wezterm.action.CloseCurrentTab {confirm = true },
	},
	-- close current pane
	{
		key = 'x',
		mods = 'CTRL|SHIFT|ALT',
		action = wezterm.action.CloseCurrentPane { confirm = true },
	},
	-- split panes
	{
		key = "v",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	-- resize panes
	{
		key = "H",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "L",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	-- select panes
	{ key = "9", mods = "CTRL", action = act.PaneSelect },
	-- select tabs
	{ key = '{', mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = '}', mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) },
	-- move tabs
	{ key = '{', mods = "CTRL|SHIFT|ALT", action = act.MoveTabRelative(-1) },
	{ key = '}', mods = "CTRL|SHIFT|ALT", action = act.MoveTabRelative(1) },
	-- Debug overlay
	{ key = "D", mods = "CTRL|SHIFT|ALT", action = act.ShowDebugOverlay },
	-- toggling opacity
	{
		key = "O",
		mods = "CTRL|ALT",
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 0.7 then
				overrides.window_background_opacity = 1.0
			else
				overrides.window_background_opacity = 0.7
			end
			window:set_config_overrides(overrides)
		end),
	},
}

-- color scheme
config.color_scheme = 'Catppuccin Mocha'

-- config.colors = {
-- 	background = '#1f212a',
-- 	-- foreground = '#7e7edd',
-- 	foreground = '#9aefea',
-- }

-- config.window_decorations = "RESIZE"
config.default_prog = { "zsh" }
config.initial_cols = 80

-- hyprland
config.enable_wayland = false

return config
