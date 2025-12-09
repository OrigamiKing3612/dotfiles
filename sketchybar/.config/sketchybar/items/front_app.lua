local settings = require("settings")

local get_focused_app_command =
	"/opt/homebrew/bin/aerospace list-windows --focused --format '%{app-name} - %{window-title}'"

local front_app = sbar.add("item", "front_app", {
	display = "active",
	icon = { drawing = false },
	label = {
		font = {
			style = settings.font.style_map["Semibold"],
			size = 12.0,
		},
	},
	updates = true,
})

front_app:subscribe("aerospace_workspace_change", function(env)
	sbar.exec(get_focused_app_command, function(result, _)
		sbar.animate("tanh", 5, function()
			front_app:set({
				label = {
					string = Trim(result),
				},
			})
		end)
	end)
end)

front_app:subscribe("mouse.clicked", function(env)
	sbar.trigger("swap_menus_and_spaces")
end)
