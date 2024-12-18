local M = {}
local ui = require("configs.common.ui")
local logger = require("configs.common.logger")
local cli = require("configs.csharp.dotnetcli")

local function CreateLaunchConfig(args)
	local project_folder_path = vim.fn.fnamemodify(args.project_information.Path, ":h")

	local build_succeded = cli.build(project_folder_path, { "-c Debug" })

	if not build_succeded then
		logger.debug("Skip debugging, build failed!", { feature = "debugger" })
		error("Skip debugging, build failed!")
	end

	return {
		name = "Launch - .NET",
		request = "launch",
		type = "coreclr",
		cwd = project_folder_path,
		program = args.project_information.TargetPath,
		args = {},
		env = {},
	}
end

local configFactories = {
	{
		name = "Launch - .NET",
		request = "launch",
		create_config = CreateLaunchConfig,
	},
}

function M.SelectDebugConfig()
	return ui.select_sync(configFactories, {
		prompt = "Start Debugging:",
		format_item = function(item)
			return item.name
		end,
	})
end

return M
