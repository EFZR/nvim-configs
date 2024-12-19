local M = {}
local dap = require("dap")

function M.get_debug_adapter()
	local debug_adapter = dap.adapters.coreclr

	if debug_adapter ~= nil then
		return debug_adapter
	end

	local mason = require("mason-registry")

	local package = mason.get_package("netcoredbg")

	if not package:is_installed() then
		package:install()
	end

	local path = package:get_install_path() .. "/netcoredbg"

	dap.adapters.coreclr = {
		type = "executable",
		command = path,
		args = {
			"--interpreter=vscode",
		},
	}

	return dap.adapters.coreclr
end

return M
