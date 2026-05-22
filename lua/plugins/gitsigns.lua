return {
	"lewis6991/gitsigns.nvim",
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
			local map = function(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			map("n", "]h", gs.next_hunk, "Next hunk")
			map("n", "[h", gs.prev_hunk, "Prev hunk")
			map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
			map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
			map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")
			map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")
			map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
			map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
			map("n", "<leader>gd", gs.diffthis, "Diff this")
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk")
		end,
	},
}
