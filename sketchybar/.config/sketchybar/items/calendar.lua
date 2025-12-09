local settings = require("settings")
local colors = require("colors")

sbar.add("item", { position = "right", width = settings.group_paddings })

local cal = sbar.add("item", {
	icon = {
		color = colors.white,
		padding_left = 0,
		font = {
			style = settings.font.style_map["Semibold"],
			size = 12.0,
		},
	},
	label = {
		color = colors.white,
		padding_right = 8,
		width = 88,
		align = "right",
		font = {
			style = settings.font.style_map["Semibold"],
			size = 12.0,
		},
	},
	position = "right",
	update_freq = 1,
	padding_left = 1,
	padding_right = 1,
	click_script = "open -a 'Calendar'",
})

-- Double border for calendar using a single item bracket
-- sbar.add("bracket", { cal.name }, {
-- 	background = {
-- 		color = colors.transparent,
-- 		height = 30,
-- 		border_color = colors.grey,
-- 	},
-- })

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
	cal:set({ icon = os.date("%a %b %d"), label = os.date("%I:%M:%S %p") })
end)
