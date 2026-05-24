return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("illuminate").configure({
			providers = { "lsp", "treesitter", "regex" },
			delay = 120,
			filetypes_denylist = {
				"alpha",
				"neo-tree",
				"NeogitStatus",
				"TelescopePrompt",
				"dap-repl",
				"dapui_scopes",
				"dapui_breakpoints",
				"dapui_stacks",
				"dapui_watches",
				"dapui_console",
			},
		})
	end,
}
