local M = {}

local function log(level, message, data)
	local logger = require("structlog")
	logger:log(vim.log.levels[level] + 1, message, data)
end

function M.trace(message, data)
	log("TRACE", message, data)
end

function M.debug(message, data)
	log("DEBUG", message, data)
end

function M.info(message, data)
	log("INFO", message, data)
end

function M.warn(message, data)
	log("WARN", message, data)
end

function M.error(message, data)
	log("ERROR", message, data)
end

return M
