return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = "folke/neodev.nvim",
	config = function()
		-- diagnostic config
		vim.diagnostic.config({
			virtual_text = true,
			update_in_insert = false,
			underline = true,
		})

		local on_attach = function(_, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }
			local keymap = vim.keymap.set
			keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
			keymap("n", "gD", "<cmd>Telescope lsp_type_definitions<CR>", opts)
			keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
			keymap("n", "gI", "<cmd>Telescope lsp_implementations<CR>", opts)
			keymap("n", "K", vim.lsp.buf.hover, opts)
			keymap("n", "gl", vim.diagnostic.open_float, opts)
			keymap("n", "]d", vim.diagnostic.goto_next, opts)
			keymap("n", "[d", vim.diagnostic.goto_prev, opts)
			keymap("n", "<leader>la", vim.lsp.buf.code_action, opts)
			keymap("n", "<leader>lr", vim.lsp.buf.rename, opts)
			keymap("n", "<leader>ls", vim.lsp.buf.signature_help, opts)
			keymap("n", "<leader>li", "<cmd>LspInfo<CR>", opts)
		end

		local common_capabilities = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			return capabilities
		end

		local servers = require("user.languages").servers
		for _, server in pairs(servers) do
			local opts = {
				on_attach = on_attach,
				capabilities = common_capabilities(),
			}

			local require_ok, settings = pcall(require, "user.lspsettings." .. server)
			if require_ok then
				opts = vim.tbl_deep_extend("force", settings, opts)
			end

			if server == "html" then
				opts.cmd = { "vscode-html-language-server", "--stdio" }
				opts.filetypes = { "typescriptreact", "html" }
			end

			if server == "lua_ls" then
				require("neodev").setup({})
			end

			if server == "omnisharp" then
				opts.cmd = { "OmniSharp", "--languageserver" }
				opts.settings = {
					FormattingOptions = {
						-- Enables support for reading code style, naming convention and analyzer
						-- settings from .editorconfig.
						EnableEditorConfigSupport = true,
						-- Specifies whether 'using' directives should be grouped and sorted during
						-- document formatting.
						OrganizeImports = true,
					},
					MsBuild = {
						-- If true, MSBuild project system will only load projects for files that
						-- were opened in the editor. This setting is useful for big C# codebases
						-- and allows for faster initialization of code navigation features only
						-- for projects that are relevant to code that is being edited. With this
						-- setting enabled OmniSharp may load fewer projects and may thus display
						-- incomplete reference lists for symbols.
						LoadProjectsOnDemand = nil,
					},
					RoslynExtensionsOptions = {
						-- Enables support for roslyn analyzers, code fixes and rulesets.
						EnableAnalyzersSupport = true,
						-- Enables support for showing unimported types and unimported extension
						-- methods in completion lists. When committed, the appropriate using
						-- directive will be added at the top of the current file. This option can
						-- have a negative impact on initial completion responsiveness,
						-- particularly for the first few completion sessions after opening a
						-- solution.
						EnableImportCompletion = true,
						-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
						-- true
						AnalyzeOpenDocumentsOnly = nil,
					},
					Sdk = {
						-- Specifies whether to include preview versions of the .NET SDK when
						-- determining which version to use for project loading.
						IncludePrereleases = true,
					},
				}
				opts.filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props", "csx", "targets" }
			end

			if server == "nil_ls" then
				opts.cmd = { "nil" }
				opts.filetypes = { "nix" }
				opts.settings = {
					["nil"] = { -- Use "nil" here to match the expected server name.
						formatting = {
							command = { "nixfmt" }, -- Use the correct path/command for the formatter.
						},
					},
				}
			end

			if server == "ts_ls" then
				local vue_language_server_path = vim.fn.stdpath("data")
					.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
				opts = {
					init_options = {
						plugins = {
							name = "@vue/typescript-plugin",
							location = vue_language_server_path,
							languages = { "vue" },
						},
					},
				}
			end

			vim.lsp.config(server, opts)
		end

		-- Ui stuff
		local default_diagnostic_config = {
			signs = {
				active = true,
				values = {
					{ name = "DiagnosticSignError", text = "" },
					{ name = "DiagnosticSignWarn", text = "" },
					{ name = "DiagnosticSignHint", text = "" },
					{ name = "DiagnosticSignInfo", text = "" },
				},
			},
			virtual_text = true,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}

		vim.diagnostic.config(default_diagnostic_config)

		for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
		end

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		vim.lsp.handlers["textDocument/signalp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
		require("lspconfig.ui.windows").default_options.border = "rounded"
	end,
}
