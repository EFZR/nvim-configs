return {
	-- "sainnhe/sonokai", 						--sonokai
	-- "sainnhe/gruvbox-material",		 		--gruvbox-material
	-- "sainnhe/edge", 							--edge
	"ellisonleao/gruvbox.nvim", 				--gruvbox
	-- "Mofiqul/vscode.nvim", 					--vscode
	-- 'tomasiser/vim-code-dark',				--codedark
	lazy = false,
	priority = 100,
	config = function()
		require("gruvbox").setup({
			contrast = "hard",
		})
		vim.cmd.colorscheme("gruvbox")
	end,
}
