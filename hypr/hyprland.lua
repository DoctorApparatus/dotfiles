hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

local terminal = "ghostty"
local fileManager = "dolphin"
local launcher = "vicinae toggle"

local fileManager = "dolphin"

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

local mainMod = "SUPER"
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("ghostty"))

local mainMod = "SUPER"

local mainMod = "SUPER"

-- Correct native Lua syntax for directional window focus
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(launcher))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + CONTROL + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CONTROL + j", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + CONTROL + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CONTROL + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + C", hl.dsp.window.close())

hl.config({
	animations = {
		enabled = false,
	},
	general = {
		gaps_in = 0,
		gaps_out = 0,
		border_size = 0,
		layout = "scrolling",
	},
	input = {
		kb_layout = "de",
		kb_options = "ctrl:nocaps",
	},
	scrolling = {
		-- Niri behavior: if there's only 1 column, span the entire monitor
		fullscreen_on_one_column = true,

		-- Niri behavior: default new columns to 50% screen width
		column_width = 0.5,

		-- Niri behavior: center focused columns instantly
		focus_fit_method = 1, -- 0 = center, 1 = fit screen
		follow_focus = true, -- Automatically camera-pan to the active window

		-- Force new windows to open as a new column to the right (like Niri)
		direction = "right",
	},
	plugin = {
		-- hyprbars = {
		-- 	bar_height = 20,
		-- 	bar_color = "rgb(151515)",
		-- 	-- col_text = "rgb(ffffff)",
		-- 	bar_text_size = 10,
		-- 	bar_text_font = "Sans",
		-- 	on_double_click = "hyprctl dispatch fullscreen 1",
		-- },
	},
})

hl.on("hyprland.start", function()
	hl.exec_cmd("vicinae server")
	hl.exec_cmd("hyprpaper")
end)
