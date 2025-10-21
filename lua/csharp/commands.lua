local M = {}
local logger = require("csharp.log")
local csharp = require("csharp.csharp-setup")

local function debug_project(buffer)
	vim.api.nvim_buf_create_user_command(
		buffer,
		"CsharpDebugProject",
		csharp.debug_project,
		{ desc = "Csharp debugger" }
	)
end

local function run_project(buffer)
	vim.api.nvim_buf_create_user_command(
		buffer,
		"CsharpRunProject",
		csharp.run_project,
		{ desc = "Csharp runs the current project" }
	)
end

function M.setup()
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)

			if client.name ~= "omnisharp" then
				return
			end

			logger.info("Registering csharp commands to buffer " .. args.buf)

			debug_project(args.buf)
			run_project(args.buf)
		end,
	})
end

return M
