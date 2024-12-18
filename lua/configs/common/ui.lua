local M = {}

function M.select_sync(items, opts)
	local co = assert(coroutine.running())
	vim.schedule(function()
		vim.ui.select(items, opts, function(item, _)
			coroutine.resume(co, item)
		end)
	end)
end

return M
