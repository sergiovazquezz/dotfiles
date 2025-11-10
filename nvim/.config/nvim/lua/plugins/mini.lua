return {
	{
		"echasnovski/mini.ai",
		version = false,
		event = "VeryLazy",
		dependencies = {
			"echasnovski/mini.extra",
		},
		config = function()
			require("mini.ai").setup({
				mappings = {
					around = "a",
					inside = "i",
				},
				custom_textobjects = {
					-- Add custom textobjects here if needed
				},
			})
		end,
	},
}
