return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		icons = { mappings = false },
		spec = {
			{ "<leader>l", group = "LSP" },
			{ "<leader>f", group = "Telescope" },
			{ "<leader>g", group = "Git" },
			{ "<leader>x", group = "Diagnostics" },
		},
	},
}
