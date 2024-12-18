local M = {}
local ui = require("configs.common.ui")
local logger = require("configs.common.logger")

local function ReadFileWithoutBom(filename)
	local file = io.open(filename, "rb")
	if file then
		local content = file:read("*all")
		file:close()

		-- Check  if the content start with the UTF-8 BOM and exclude it if present
		if content:sub(1, 3) == "\xEF\xBB\xBF" then
			content:sub(4)
		end

		return vim.json.decode(content)
	else
		return nil
	end
end

local function GetLaunchProfiles(projectFolder)
	local filename = projectFolder .. "/Properties/launchSettings.json"
	local launchSettings = ReadFileWithoutBom(filename)

	if launchSettings == nil then
		logger.warn(
			"The launch profile file could not be opened or does not exist. Skipping the loading of the launch profile.",
			{ feature = "configs.csharp.launch-settings" }
		)
		return {}
	end

	local profiles = {}
	for profilename, profile in pairs(launchSettings.profiles) do
		if profile.commandName ~= "Project" then
			logger.debug("Skipping profile.", {
				feature = "configs.csharp.launch-settings",
				profile_name = profilename,
				profile = profile,
				file_name = filename,
			})
		else
			profile.name = profilename
			table.insert(profiles, profile)
		end
	end

	logger.debug(
		"Found profiles.",
		{ feature = "configs.csharp.launch-settings", profiles = profiles, file_name = filename }
	)
	return profiles
end

function M.SelectLaunchProfile(projectFolder)
	local launcProfiles = GetLaunchProfiles(projectFolder)

	if #launcProfiles == 0 then
		return
	elseif #launcProfiles == 1 then
		return launcProfiles[1]
	end

	return ui.select_sync(launcProfiles, {
		prompt = "Select Launch Profile:",
		format_item = function(item)
			return item.name
		end,
	})
end

return M
