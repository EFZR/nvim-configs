return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", lazy = true },
		{ "nvim-lua/plenary.nvim" },
	},
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope find files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Telescope live grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Telescope buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Telescope help tags" },
		{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Telescope  keymaps" },
		{ "<leader>fr", "<cmd>Telescope git_branches<cr>", desc = "Telescope git branch" },
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
					hidden = true,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
			},
			defaults = {
				file_ignore_patterns = { "node_modules/", ".yarn/", ".git/", ".idea/" },
			},
		})
	end,
}
