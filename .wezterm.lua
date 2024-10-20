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

-- config.font = wezterm.font("JetBrainsMono NF")
config.cell_width = 0.9
config.window_background_opacity = 0.8
config.prefer_egl = true
config.font_size = 12.0

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

-- tabs
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false


-- keymaps
config.keys = {
	-- close current pane
	{
		key = 'x',
		mods = 'CTRL|SHIFT|ALT',
		action = wezterm.action.CloseCurrentPane { confirm = true },
	},
	-- split panes
	{
		key = "h",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	-- resize panes
	{
		key = "h",
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
	-- Debug overlay
	{ key = "L", mods = "CTRL|SHIFT|ALT", action = act.ShowDebugOverlay },
	-- toggling opacity
	{
		key = "O",
		mods = "CTRL|ALT",
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 0.8 then
				overrides.window_background_opacity = 0.5
			else
				overrides.window_background_opacity = 0.8
			end
			window:set_config_overrides(overrides)
		end),
	},
}

-- color scheme
config.color_scheme = 'Gogh (Gogh)'

config.colors = {
	background = "#0c0b0f", -- dark purple
	cursor_border = "#bea3c7",
	cursor_bg = "#bea3c7",

	tab_bar = {
		background = "#0c0b0f",
		-- background = "rgba(0, 0, 0, 0%)",
		active_tab = {
			bg_color = "#0c0b0f",
			fg_color = "#bea3c7",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#0c0b0f",
			fg_color = "#f8f2f5",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},

		new_tab = {
			bg_color = "#0c0b0f",
			fg_color = "white",
		},
	},
}

config.window_frame = {
	-- font = wezterm.font({ family = "JetBrainsMono NF", weight = "Light" }),
	active_titlebar_bg = "#0c0b0f",
}

-- config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.window_decorations = "NONE | RESIZE"
config.default_prog = { "bash" }
config.initial_cols = 80

-- and finally, return the configuration to wezterm
return config
