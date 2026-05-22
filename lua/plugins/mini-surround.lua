return {
	"echasnovski/mini.surround",
	enabled = false,
	event = "BufReadPost",
	opts = {
		mappings = {
			add = "sa",
			delete = "sd",
			replace = "sr",
			find = "sf",
			find_left = "sF",
			highlight = "sh",
			update_n_lines = "sn",
		},
	},
}
