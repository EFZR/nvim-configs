return {
	"ellisonleao/gruvbox.nvim",
	-- "Mofiqul/vscode.nvim",
	lazy = false,
	priority = 100,
	config = function()
		vim.cmd.colorscheme("gruvbox")
	end,
}
