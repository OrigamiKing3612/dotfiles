local mod                = "SUPER"
local terminal           = "ghostty"
local fileManager        = "nautilus"
-- local menu               = "wofi --show drun"
-- local run                = "rofi -show drun"
local run                = "hyprlauncher"

local current_workspace  = 1
local previous_workspace = 1

hl.bind(mod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mod .. " + SHIFT + F", hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + space", function()
    current_workspace, previous_workspace =
        previous_workspace, current_workspace

    hl.dispatch(hl.dsp.focus({
        workspace = current_workspace
    }))
end)
hl.bind("CTRL + space", hl.dsp.exec_cmd(run))
hl.bind(mod .. " + SHIFT + CTRL", hl.dsp.exec_cmd("hyprlock"))
hl.bind("CTRL + ALT + escape", hl.dsp.exec_cmd("uuctl"))
hl.bind(mod .. " + slash", hl.dsp.layout("togglesplit"))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m region"))

hl.bind(mod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + j", hl.dsp.focus({ direction = "down" }))

hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mod .. " + " .. key, function()
        if current_workspace ~= i then
            previous_workspace = current_workspace
            current_workspace = i
        end
        hl.dispatch(hl.dsp.focus({ workspace = i }))
    end)
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mod .. " + semicolon", hl.dsp.submap("service"))
hl.bind(mod .. " + r", hl.dsp.submap("resize"))

hl.define_submap("service", function()
    hl.bind("v", function()
        hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
        hl.dispatch(hl.dsp.submap("reset"))
    end)
    hl.bind("f", function()
        hl.dispatch(hl.dsp.window.fullscreen())
        hl.dispatch(hl.dsp.submap("reset"))
    end)
    hl.bind("b", function()
        hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/restartwaybar.sh"))
        hl.dispatch(hl.dsp.submap("reset"))
    end)

    hl.bind("escape", hl.dsp.submap("reset"))
    hl.bind("return", hl.dsp.submap("reset"))
end)

hl.define_submap("resize", function()
    hl.bind(mod .. " + SHIFT + left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind(mod .. " + SHIFT + right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind(mod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind(mod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

    hl.bind(mod .. " + SHIFT + h", hl.dsp.window.resize({ x = -15, y = 0, relative = true }), { repeating = true })
    hl.bind(mod .. " + SHIFT + l", hl.dsp.window.resize({ x = 15, y = 0, relative = true }), { repeating = true })
    hl.bind(mod .. " + SHIFT + k", hl.dsp.window.resize({ x = 0, y = -15, relative = true }), { repeating = true })
    hl.bind(mod .. " + SHIFT + j", hl.dsp.window.resize({ x = 0, y = 15, relative = true }), { repeating = true })

    hl.bind("escape", hl.dsp.submap("reset"))
    hl.bind("return", hl.dsp.submap("reset"))
end)
