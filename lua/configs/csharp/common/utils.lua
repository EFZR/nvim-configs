local M = {}

--- @param buffer number
--- @return table|nil
function M.get_omnisharp_client(buffer)
	local clients = vim.lsp.get_clients({ buffer = buffer })

	for _, client in ipairs(clients) do
		if client.name == "omnisharp" then
			return client
		end
	end
end

function M.run_async(fn)
	local co = coroutine.create(fn)
	local success, result = coroutine.resume(co)

	if not success then
		require("configs.common.logger").error(
			"Error has occurred!",
			{ feature = "run-async", error_message = result, stack_trace = debug.traceback(co) }
		)
	end
end

return M
