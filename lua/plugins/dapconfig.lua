return {
	{
		"mfussenegger/nvim-dap",

		config = function()
			local dap = require("dap")
			local logger = require("configs.common.logger")
			local notify = require("configs.common.notify")

			local netcoredbg_path = vim.fn.exepath("netcoredbg")
			if not netcoredbg_path then
				error("netcoredbg not found! Install it with :MasonInstall netcoredbg")
			end

			dap.adapters.coreclr = {
				type = "executable",
				command = netcoredbg_path,
				args = { "--interpreter=vscode" },
			}

			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "launch - netcoredbg",
					request = "launch",
					program = function()
						-- TODO: Implement launch profile.
						notify.info("Preparing debugger!")
						local project_information =
							require("configs.csharp.features.workspace-information").select_project()

						if project_information == nil then
							logger.error("No project selected", { feature = "debugger" })
							return
						end

						local project_folder_path = vim.fn.fnamemodify(project_information.Path, ":h")

						-- Dynamically find the .dll file
						local dll_path = vim.fn.glob(
							project_folder_path
								.. "/bin/Debug/net*/"
								.. vim.fn.fnamemodify(project_folder_path, ":t")
								.. ".dll"
						)

						if dll_path == "" then
							logger.error("No .dll file found in the project folder", { feature = "debugger" })
							notify.error("No .dll file found. Make sure the project is built.")
							return
						end

						logger.info("The Project path being run, " .. dll_path, { feature = "debugger" })

						return dll_path
					end,
				},
				{
					type = "coreclr",
					name = "attach - netcoredbg",
					request = "attach",
					processId = require("dap.utils").pick_process,
				},
			}

			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end)
			vim.keymap.set("n", "<F6>", function()
				dap.restart()
			end)
			vim.keymap.set("n", "<F10>", function()
				dap.step_over()
			end)
			vim.keymap.set("n", "<F11>", function()
				dap.step_into()
			end)
			vim.keymap.set("n", "<F12>", function()
				dap.step_out()
			end)
			vim.keymap.set("n", "<Leader>b", function()
				dap.toggle_breakpoint()
			end)
			vim.keymap.set("n", "<Leader>B", function()
				dap.set_breakpoint()
			end)
			vim.keymap.set("n", "<Leader>lp", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end)
			vim.keymap.set("n", "<Leader>dr", function()
				dap.repl.toggle()
			end)
			vim.keymap.set("n", "<Leader>dl", function()
				dap.run_last()
			end)
			vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
				require("dap.ui.widgets").hover()
			end)
			vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
				require("dap.ui.widgets").preview()
			end)
			vim.keymap.set("n", "<Leader>df", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end)
			vim.keymap.set("n", "<Leader>ds", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end)
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
			vim.keymap.set("n", "<C-n>", function()
				dapui.toggle()
			end)
		end,
	},
}
