local M = {}

-- TODO: Apply this functionality in the dapconfigs
--- @param debug_config table
--- @param launch_profile DotNetLaunchProfile
--- @return table
function M.apply_launch_profile(debug_config, launch_profile)
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

return M
