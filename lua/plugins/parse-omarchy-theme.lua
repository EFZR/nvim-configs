-- Parse the current Omarchy theme and apply to your non-LazyVim setup
local theme_file = vim.fn.expand("~/.config/omarchy/current/theme/neovim.lua")
local colorscheme_to_load = nil

-- Safely load and extract colorscheme from Omarchy file
if vim.fn.filereadable(theme_file) == 1 then
	local ok, omarchy_theme = pcall(dofile, theme_file)
	if ok and type(omarchy_theme) == "table" then
		for _, plugin in ipairs(omarchy_theme) do
			if
				type(plugin) == "table"
				and plugin[1] == "LazyVim/LazyVim"
				and plugin.opts
				and plugin.opts.colorscheme
			then
				colorscheme_to_load = plugin.opts.colorscheme
				break
			end
		end
	end
end

-- Mapping from Omarchy colorscheme → your Neovim theme setup
local theme_specs = {
	catppuccin = {
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({})
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	["catppuccin-latte"] = {
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({ flavour = "latte" })
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	everforest = {
		"neanias/everforest-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({ background = "soft" })
			vim.cmd.colorscheme("everforest")
		end,
	},

	["flexoki-light"] = {
		"kepano/flexoki-neovim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("flexoki-light")
		end,
	},

	gruvbox = {
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},

	kanagawa = {
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa")
		end,
	},

	matteblack = {
		"tahayvr/matteblack.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("matteblack")
		end,
	},

	nordfox = {
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("nordfox")
		end,
	},

	bamboo = {
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({})
			require("bamboo").load()
		end,
	},

	["monokai-pro"] = {
		"gthelding/monokai-pro.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("monokai-pro").setup({
				filter = "ristretto",
				override = function()
					return {
						NonText = { fg = "#948a8b" },
						MiniIconsGrey = { fg = "#948a8b" },
						MiniIconsRed = { fg = "#fd6883" },
						MiniIconsBlue = { fg = "#85dacc" },
						MiniIconsGreen = { fg = "#adda78" },
						MiniIconsYellow = { fg = "#f9cc6c" },
						MiniIconsOrange = { fg = "#f38d70" },
						MiniIconsPurple = { fg = "#a8a9eb" },
						MiniIconsAzure = { fg = "#a8a9eb" },
						MiniIconsCyan = { fg = "#85dacc" },
					}
				end,
			})
			vim.cmd.colorscheme("monokai-pro")
		end,
	},

	["rose-pine-dawn"] = {
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("rose-pine-dawn")
		end,
	},

	["tokyonight-night"] = {
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
}

-- Return the proper theme or fallback
if colorscheme_to_load and theme_specs[colorscheme_to_load] then
	return theme_specs[colorscheme_to_load]
else
	vim.notify(
		string.format("Omarchy theme not found (%s), defaulting to bamboo", tostring(colorscheme_to_load)),
		vim.log.levels.WARN
	)
	return theme_specs["bamboo"]
end
