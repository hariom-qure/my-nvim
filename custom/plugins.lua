local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},
	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- disable which-key
	{
		"folke/which-key.nvim",
		enabled = false,
	},

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	{
		"tpope/vim-surround",
		event = "VeryLazy",
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- {
	-- 	"f-person/auto-dark-mode.nvim",
	-- 	config = {
	-- 		update_interval = 1000,
	-- 		set_dark_mode = function()
	-- 			-- vim.api.nvim_set_option("background", "dark")
 --        vim.g.nvchad_theme = "palenight"
 --        require("base46").load_all_highlights()
 --        vim.api.nvim_exec_autocmds("User", { pattern = "NvChadThemeReload" })
	-- 		end,
	-- 		set_light_mode = function()
 --        -- vim.api.nvim_set_option("background", "light")
 --        vim.g.nvchad_theme = "one_light"
 --        require("base46").load_all_highlights()
 --        vim.api.nvim_exec_autocmds("User", { pattern = "NvChadThemeReload" })
	-- 		end,
	-- 	},
	-- 	init = function()
	-- 		require("auto-dark-mode").init()
	-- 	end,
	-- },
}

return plugins
