local colors = require("colors")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

sbar.add("event", "aerospace_workspace_change")

local get_focused_app_command = "/opt/homebrew/bin/aerospace list-windows --focused --format '%{app-name}'"
local get_focused_window_command = "/opt/homebrew/bin/aerospace list-workspaces --focused"

local spaces = {}

for i = 1, 10, 1 do
	local space = sbar.add("space", "space." .. i, {
		space = i,
		icon = {
			font = { family = settings.font.numbers },
			string = i,
			padding_left = 15,
			padding_right = 8,
			color = colors.white,
			highlight_color = colors.blue,
		},
		label = {
			padding_right = 8,
			color = colors.grey,
			highlight_color = colors.white,
			font = "sketchybar-app-font:Regular:16.0",
			y_offset = -1,
		},
		padding_right = 1,
		padding_left = 1,
		background = {
			height = 26,
		},
		popup = { background = { border_width = 5, border_color = colors.black } },
	})

	spaces[i] = space

	local space_bracket = sbar.add("bracket", { space.name }, {
		background = {
			color = colors.transparent,
			border_color = colors.bg2,
			height = 28,
			border_width = 2,
		},
	})

	-- Padding space
	sbar.add("space", "space.padding." .. i, {
		space = i,
		script = "",
		width = settings.group_paddings,
	})

	local space_popup = sbar.add("item", {
		position = "popup." .. space.name,
		padding_left = 5,
		padding_right = 0,
		background = {
			drawing = true,
			image = {
				corner_radius = 9,
				scale = 0.2,
			},
		},
	})

	space:subscribe("aerospace_workspace_change", function(env)
		local selected = tonumber(env.FOCUSED_WORKSPACE) == i
		space:set({
			icon = { highlight = selected },
			label = { highlight = selected },
			background = { border_color = selected and colors.black or colors.bg2 },
		})
		space_bracket:set({
			background = { border_color = selected and colors.grey or colors.bg2 },
		})
	end)

	space:subscribe("mouse.clicked", function(env)
		if env.BUTTON == "other" then
			space_popup:set({ background = { image = "space." .. env.SID } })
			space:set({ popup = { drawing = "toggle" } })
		else
			sbar.exec("aerospace workspace --fail-if-noop " .. env.SID)
		end
	end)

	space:subscribe("mouse.exited", function(_)
		space:set({ popup = { drawing = false } })
	end)
end

local space_window_observer = sbar.add("item", {
	drawing = false,
	updates = true,
})

space_window_observer:subscribe("aerospace_workspace_change", function(env)
	sbar.exec(get_focused_app_command, function(result, _)
		local app = Trim(result)
		local icon_line = ""
		local no_app = (app == "")
		local lookup = app_icons[app]
		local icon = ((lookup == nil) and app_icons["Default"] or lookup)
		icon_line = icon_line .. icon

		if no_app then
			icon_line = " —"
		end

		sbar.exec(get_focused_window_command, function(ws_raw, _)
			local ws = tonumber(Trim(ws_raw))
			if not ws or not spaces[ws] then
				return
			end

			sbar.animate("tanh", 10, function()
				spaces[ws]:set({
					label = icon_line,
				})
				spaces[ws]:set({
					label = {
						padding_right = 12,
					},
				})
			end)
		end)
	end)
end)
