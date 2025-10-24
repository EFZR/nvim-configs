-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
	desc = "Briefly highlight yanked text",
})

-- Set indentation for html files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "html",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.smarttab = true
	end,
	desc = "Set indentation for html files",
})

-- Set indentation for C# files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cs",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.smarttab = true
	end,
	desc = "Set indentation for C# files",
})

-- Set indentation for Python files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "py",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.smarttab = true
	end,
	desc = "Set indentation for Python files",
})

-- Set indentation for Rust files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "rs",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.smarttab = true
	end,
	desc = "Set indentation for Rust files",
})
