local M = {}
---@class CsharpConfig
local config

---@class CsharpConfig
local default_config = {
	--- @class CsharpConfig.Dap
	dap = {
		--- @type string?
		adapter_name = nil,
	},
	---@class CsharpConfig.Logging
	logging = {
		level = "INFO",
	},
}

---@param base table
---@param user_config table
---@return table
local function merge(base, user_config)
	return vim.tbl_deep_extend("force", base, user_config)
end

function M.get_defaults()
	return vim.tbl_deep_extend("force", default_config, {})
end

---@param user_config CsharpConfig?
---@return CsharpConfig
function M.set_defaults(user_config)
	if user_config == nil or vim.tbl_isempty(user_config) then
		return M.get_defaults()
	end

	--- @type CsharpConfig
	local merged_config = merge(default_config, user_config)

	local deprecated_omnisharp_keys = {
		"enable",
		"enable_editor_config_support",
		"organize_imports",
		"load_projects_on_demand",
		"enable_analyzers_support",
		"enable_import_completion",
		"include_prerelease_sdks",
		"analyze_open_documents_only",
		"default_timeout",
		"enable_package_auto_restore",
		"debug",
	}

	for _, key in ipairs(deprecated_omnisharp_keys) do
		if merged_config.lsp.omnisharp[key] ~= nil then
			merged_config.lsp.omnisharp[key] = nil
		end
	end

	return merged_config
end

---@param user_config CsharpConfig
function M.save(user_config)
	config = user_config
end

---@return CsharpConfig
function M.get_config()
	return config
end

return M
