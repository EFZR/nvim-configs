local M = {}
local logger = require("configs.common.logger")

local function execute_command(cmd)
	local file = io.popen(cmd .. " 2>&1")
	local output = file:read("*all")

	local success, _, exit_code = file:close()
	return output, success and 0 or exit_code
end

--- @param target string File path to solution or project
--- @param options string[]?
--- @return boolean
function M.build(target, options)
	local command = "dotnet build " .. target

	if options then
		command = command .. " " .. table.concat(options, " ")
	end

	logger.debug("Executing: " .. command, { feature = "dotnet-cli" })

	local _, exit_code = execute_command(command)

	--- @type boolean
	local build_succeded = exit_code == 0

	if build_succeded then
	else
		logger.debug("Build failed", { feature = "dotnet-cli" })
	end

	return build_succeded
end

--- @param options string[]?
function M.run(options)
	local command = "dotnet run"

	if options then
		command = command .. " " .. table.concat(options, " ")
	end

	logger.debug("Executing: " .. command, { feature = "dotnet-cli" })
	local current_window = vim.api.nvim_get_current_win()
	vim.cmd("split | term " .. command)
	vim.api.nvim_set_current_win(current_window)
end

return M
