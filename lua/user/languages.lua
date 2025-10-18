local M = {}

M.servers = {
	"lua_ls",
	"omnisharp",
	"cssls",
	"html",
	"jsonls",
	"marksman",
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
	"python"
}

M.fmtNLint = {
	"prettier",
	"stylua",
	"csharpier",
	"markdownlint",
	"eslint_d",
}

M.debugger = {
	"coreclr",
}

return M
