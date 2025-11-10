return {
    "everviolet/nvim",
    name = "evergarden",
    priority = 1000,
    opts = {
        theme = {
            variant = "winter",
            accent = "black",
        },
        editor = {
            transparent_background = false,
            sign = { color = "none" },
            float = {
                color = "none",
                solid_border = false,
            },
            completion = {
                color = "none",
            },
        },
        integrations = {
            blink_cmp = true,
            gitsigns = true,
            mini = {
                enable = true,
                clue = true,
                hipatterns = true,
                surround = true,
            },
            which_key = true,
        },
    },
}
