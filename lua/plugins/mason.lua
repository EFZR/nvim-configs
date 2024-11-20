return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
			},
		},
		keys = {
			{ "<leader>m", "<cmd>Mason<CR>", desc = "Opens Mason" },
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = require("user.languages").debugger,
				automatic_installation = false,
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = require("user.languages").servers,
			})
		end,
	},
}
