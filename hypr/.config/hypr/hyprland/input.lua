hl.config({
    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "ctrl:nocaps",
        kb_rules     = "",

        follow_mouse = 1,

        sensitivity  = 0,

        touchpad     = {
            natural_scroll = false,
            clickfinger_behavior = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})
