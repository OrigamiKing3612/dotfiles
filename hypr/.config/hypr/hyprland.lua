hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "0x0",
    scale    = "1",
    disabled = true,
})

hl.monitor({
    output = "DP-2",
    mode = "preferred",
    position = '1920x0',
    scale = "1"
})

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper & waybar & swaync & hypridle & blueman-applet &")
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

require("hyprland.looks")
require("hyprland.input")
require("hyprland.keys")
