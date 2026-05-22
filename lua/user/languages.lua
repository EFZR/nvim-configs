local M = {}

M.servers = {
	"bashls",
	"cssls",
	"dockerls",
	"omnisharp",
	"html",
	"jsonls",
	"lua_ls",
	"marksman",
	"pyright",
	-- "sqls", -- commented out as in your original snippet
	"tailwindcss",
	"ts_ls",
	"vue_ls",
	"yamlls",
	"emmet_ls",
	"clangd",
}

M.parsers = {
	"lua",
	"vim",
	"markdown",
	"c_sharp",
	"javascript",
	"typescript",
	"tsx",
	"html",
	"css",
	"json",
	"toml",
	"python",
}

M.formatters = {
	"prettierd",
	"stylua",
	"csharpier",
	"gofmt",
	"sqlfmt",
	"ruff",
}

M.linters = {
	"eslint_d",
	"markdownlint",
}

-- Only packages that exist in the Mason registry
-- gofmt ships with Go; sqlfmt must be installed manually
M.tools = {
	"prettierd",
	"stylua",
	"csharpier",
	"ruff",
	"eslint_d",
	"markdownlint",
}

M.debugger = {
	"coreclr",
	"js",
}

return M
