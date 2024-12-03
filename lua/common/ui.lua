function M.select_sync(items, opts)
	local co = assert(coroutine.running())
	vim.schedule(function()
		vim.ui.select(items, opts, function(selected)
			coroutine.resume(co, selected)
		end)
	end)

	return coroutine.yield()
end
