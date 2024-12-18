local M = {}
local logger = require("configs.common.logger")

local function execute_command(cmd)
	if not cmd or cmd == "" then
		return nil, "Command is empty or not provided"
	end

	local file, err = io.popen(cmd .. " 2>&1")
	if not file then
		return nil, "Failed to execute command: " .. (err or "unknown error")
	end

	local output = file:read("*all")
	local success, _, exit_code = file:close()

	return output, success and 0 or exit_code
end

function M.build(target, options)
	local command = "dotnet build" .. target

	if options then
		command = command .. " " .. table.concat(options, " ")
	end

	logger.debug("Executing: " .. command, { feature = "configs.csharp.dotnetcli" })

	local _, exit_code = execute_command(command)

	local buildSucceded = exit_code == 0

	if buildSucceded then
	else
		logger.debug("Build Failed", { feature = "extras.csharp" })
	end

	return buildSucceded
end

function M.run(options)
	local command = "dotnet run"

	if options then
		command = command .. " " .. table.concat(options, " ")
	end

	logger.debug("Executing: " .. command, { feature = "configs.csharp.dotnetcli" })

	local currentWindow = vim.api.nvim_get_current_win()

	vim.cmd("split | term" .. command)

	vim.api.nvim_set_current_win(currentWindow)
end

return M
