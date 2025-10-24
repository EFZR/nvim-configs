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

-- Set indentation for TypeScript files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "ts",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.smarttab = true
	end,
	desc = "Set indentation for TypeScript files",
})

-- Set indentation for TypeScript React files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "tsx",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.smarttab = true
	end,
	desc = "Set indentation for TypeScript React files",
})

-- Set indentation for JavaScript files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "js",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.smarttab = true
	end,
	desc = "Set indentation for JavaScript files",
})

-- Set indentation for JavaScript React files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "jsx",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.smarttab = true
	end,
	desc = "Set indentation for JavaScript React files",
})

-- Set indentation for JavaScript React files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.shiftwidth = 3
		vim.opt_local.tabstop = 3
		vim.opt_local.softtabstop = 3
		vim.opt_local.smarttab = true
	end,
	desc = "Set indentation to 3 spaces for Markdown files",
})
