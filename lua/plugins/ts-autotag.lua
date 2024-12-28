return {
	"windwp/nvim-ts-autotag",
	lazy = false,
	events = { "BufReadPre", "BufNewFile" },
	config = function()
		local ts = require("nvim-ts-autotag")
		ts.setup()
	end,
}
