local M = {}
local logger = require("configs.common.logger")
local notify = require("configs.common.notify")

--- @param debug_config table
--- @param launch_profile DotNetLaunchProfile
--- @return table
local function apply_launch_profile(debug_config, launch_profile)
	if launch_profile.environmentVariables then
		for key, value in pairs(launch_profile.environmentVariables) do
			debug_config.env[key] = value
		end
	end

	if launch_profile.commandLineArgs then
		vim.tbl_deep_extend(
			"force",
			debug_config.args,
			vim.split(launch_profile.commandLineArgs, " ", { trimempty = true })
		)
	end

	if launch_profile.applicationUrl then
		table.insert(debug_config.args, "--urls=" .. launch_profile.applicationUrl)
	end

	return debug_config
end

--- @async
--- @return table | nil
function M.execute()
	notify.info("Preparing debugger!")
	local debug_config_factory = require("configs.csharp.features.debugger.config_factories").select_debug_config()
	local debug_config

	logger.debug("Selected debug config factory", { feature = "debugger", debug_config_factory = debug_config_factory })
	if debug_config_factory.request == "attach" then
		debug_config = debug_config_factory.create_config({})
	else
		local project_information = require("configs.csharp.features.workspace-information").select_project()

		if project_information == nil then
			logger.error("No project selected", { feature = "debugger" })
			return
		end

		debug_config = debug_config_factory.create_config({ project_information = project_information })
		local project_folder_path = vim.fn.fnamemodify(project_information.Path, ":h")
		local launch_profile =
			require("configs.csharp.modules.launch-settings").select_launch_profile(project_folder_path)

		if launch_profile then
			logger.debug(
				"Applying launch profile to debug config.",
				{ feature = "debugger", launch_profile = launch_profile, debug_config }
			)
			debug_config = apply_launch_profile(debug_config, launch_profile)
		end
	end

	logger.debug("Starting debugger", { feature = "debugger", debug_config = debug_config })
	notify.info("Starting debugger!")
	return debug_config
end

return M
