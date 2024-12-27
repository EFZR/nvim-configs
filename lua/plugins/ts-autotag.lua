return {
	"windwp/nvim-ts-autotag",
	lazy = false,
	events = { "BufReadPre", "BufNewFile" },
	config = function()
		local ts = require("nvim-ts-autotag")

		ts.opts = {
			-- Defaults
			enable_close = true, -- Auto close tags
			enable_rename = true, -- Auto rename pairs of tags
			enable_close_on_slash = false, -- Auto close on trailing </
		}

		-- Also override individual filetype configs, these take priority.
		-- Empty by default, useful if one of the "opts" global settings
		-- doesn't work well in a specific filetype
		ts.per_filetype = {
			["html"] = {
				enable_close = false,
			},
		}
	end,
}
