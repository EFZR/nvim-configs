---@param user_config CsharpConfig?
local function setup(user_config)
	local config = require("csharp.config")
	user_config = config.set_defaults(user_config)
	config.save(user_config)

	require("csharp.commands").setup()
	require("csharp.log").setup()
end

return {
	setup = setup,
	debug_project = require("csharp.features.debugger").execute,
	run_project = require("csharp.features.code-runner").execute,
}
