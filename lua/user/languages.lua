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
	"http",
}

M.fmtNLint = {
	"prettier",
	"stylua",
	"csharpier",
	"markdownlint",
	"eslint_d",
	"gofmt",
	"sqlfmt",
}

M.debugger = {
	"coreclr",
}

return M
