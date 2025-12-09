local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local popup_width = 300

local wifi = sbar.add("item", "widgets.wifi.padding", {
	position = "right",
	label = { drawing = false },
})

-- Background around the item
local wifi_bracket = sbar.add("bracket", "widgets.wifi.bracket", {
	wifi.name,
}, {
	popup = { align = "center", height = 30 },
})

local ip = sbar.add("item", {
	position = "popup." .. wifi_bracket.name,
	icon = {
		align = "left",
		string = "IP:",
		width = popup_width / 2,
	},
	label = {
		string = "???.???.???.???",
		width = popup_width / 2,
		align = "right",
	},
})

local mask = sbar.add("item", {
	position = "popup." .. wifi_bracket.name,
	icon = {
		align = "left",
		string = "Subnet mask:",
		width = popup_width / 2,
	},
	label = {
		string = "???.???.???.???",
		width = popup_width / 2,
		align = "right",
	},
})

local router = sbar.add("item", {
	position = "popup." .. wifi_bracket.name,
	icon = {
		align = "left",
		string = "Router:",
		width = popup_width / 2,
	},
	label = {
		string = "???.???.???.???",
		width = popup_width / 2,
		align = "right",
	},
})

sbar.add("item", { position = "right", width = settings.group_paddings })

wifi:subscribe({ "wifi_change", "system_woke" }, function(env)
	sbar.exec("ipconfig getifaddr en0", function(ip)
		local connected = not (ip == "")
		wifi:set({
			icon = {
				string = connected and icons.wifi.connected or icons.wifi.disconnected,
				color = connected and colors.white or colors.red,
			},
		})
	end)
end)

local function hide_details()
	wifi_bracket:set({ popup = { drawing = false } })
end

local function toggle_details()
	local should_draw = wifi_bracket:query().popup.drawing == "off"
	if should_draw then
		wifi_bracket:set({ popup = { drawing = true } })
		sbar.exec("ipconfig getifaddr en0", function(result)
			ip:set({ label = result })
		end)
		sbar.exec("networksetup -getinfo Wi-Fi | awk -F 'Subnet mask: ' '/^Subnet mask: / {print $2}'", function(result)
			mask:set({ label = result })
		end)
		sbar.exec("networksetup -getinfo Wi-Fi | awk -F 'Router: ' '/^Router: / {print $2}'", function(result)
			router:set({ label = result })
		end)
	else
		hide_details()
	end
end

wifi:subscribe("mouse.clicked", toggle_details)
wifi:subscribe("mouse.exited.global", hide_details)

local function copy_label_to_clipboard(env)
	local label = sbar.query(env.NAME).label.value
	sbar.exec('echo "' .. label .. '" | pbcopy')
	sbar.set(env.NAME, { label = { string = icons.clipboard, align = "center" } })
	sbar.delay(1, function()
		sbar.set(env.NAME, { label = { string = label, align = "right" } })
	end)
end

ip:subscribe("mouse.clicked", copy_label_to_clipboard)
mask:subscribe("mouse.clicked", copy_label_to_clipboard)
router:subscribe("mouse.clicked", copy_label_to_clipboard)
