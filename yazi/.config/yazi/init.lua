require("git"):setup({ order = 0 })

require("full-border"):setup({
	type = ui.Border.ROUNDED, -- ROUNDED or PLAIN
})

require("starship"):setup({
	config_file = "~/.config/starship/starship.toml",
})
