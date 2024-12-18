return {
	"Tastyep/structlog.nvim",

	config = function()
		local logger = require("structlog")

		logger.configure({
			my_logger = {
				pipelines = {
					{
						level = logger.level.TRACE,
						processors = {
							logger.processors.StackWriter({ "line", "file" }, { max_parents = 3 }),
							logger.processors.Timestamper("%H:%M:%S"),
							function(log)
								log["buffer"] = vim.api.nvim_get_current_buf()
								return log
							end,
						},

						formatter = logger.formatters.Format( --
							"%s [%s] %s: %-30s buffer=%s",
							{ "timestamp", "level", "logger_name", "msg", "buffer" }
						),
						sink = logger.sinks.File(vim.fn.stdpath("log") .. "/csharp.log"),
					},
				},
			},
		})
	end,
}
