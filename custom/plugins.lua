local overrides = require("custom.configs.overrides")

-- local function pretty_table(tbl)
--   local result = ""
--   for index, data in ipairs(tbl) do
--     result = result .. tostring(index)
--
--
--     for key, value in pairs(data) do
--       result = result .. "\t" .. tostring(key) .. tostring(value)
--     end
--   end
--   return result
-- end

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
		event = "BufEnter *",
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

  -- dap
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function ()
      require("custom.configs.dap").setup()
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {}
  },
  {
    "Weissle/persistent-breakpoints.nvim",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {
      load_breakpoints_event = { "BufReadPost" }
    },
  },
  {
    'mfussenegger/nvim-dap-python',
    dependencies = { "mfussenegger/nvim-dap" },
    event = "BufRead *.py",
    config = function()
      require('dap-python').setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
      local dap = require("dap")
      local project_specific = require("custom.utils").get_dap_configuration("python")
      if project_specific then
        vim.list_extend(dap.configurations.python, project_specific)
      end
    end
  },

  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  },
}

return plugins
