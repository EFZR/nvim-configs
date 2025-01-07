return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = ":TSUpdate",
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup({
			ensure_installed = require("user.languages").parsers,
			context_commentstring = {
				enable = true,
			},
			highlight = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
			},
			indent = {
				enable = true,
				disable = { "python" },
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
