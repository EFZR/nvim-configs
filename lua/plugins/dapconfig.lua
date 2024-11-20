return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			dap.adapters.coreclr = {
				type = "executable",
				command = "netcoredbg",
				args = { "--interpreter=vscode" },
			}

			dap.configurations.cs = {
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					return vim.fn.input("path to dll", vim.fn.getcwd() .. "/bin/debug/", "file")
				end,
			}

			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
			vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<F6>", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Set Breakpoint" })
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dapui = require("dapui")
			vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })
		end,
	},
}
