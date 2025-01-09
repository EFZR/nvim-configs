local M = {}

M.servers = {
	"lua_ls",
	"omnisharp",
	"cssls",
	"html",
	"jsonls",
	"marksman",
	"nil_ls",
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
	"nix"
}

M.fmtNLint = {
	"prettier",
	"stylua",
	"csharpier",
	"markdownlint",
	"eslint_d",
	"nixpkgs-fmt",
}

M.debugger = {
	"coreclr",
}

return M
