local ui = require("csharp.ui")

--- @async
--- @param _ DebugConfigFactoryArgs
--- @return table
local function create_config(_)
	local processes = require("dap.utils").get_processes()
	local process = ui.select_sync(processes, {
		format_item = function(item)
			return item.name
		end,
	})

	return {
		name = "Attach - .NET",
		request = "attach",
		type = "coreclr",
		processId = process.pid,
	}
end

return {
	name = "Attach - .NET",
	request = "attach",
	create_config = create_config,
}
