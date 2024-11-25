local M = {}

M.servers = {
	"lua_ls",
	"omnisharp",
	"cssls",
	"html",
	"jsonls",
	"marksman"
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
}

M.fmtNLint = {
	"prettier",
	"stylua",
	"csharpier",
	"markdownlint"
}

M.debugger = {
	"coreclr",
}

return M
