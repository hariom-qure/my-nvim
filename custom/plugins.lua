local overrides = require("custom.configs.overrides")
local all_configs = require("custom.configs.all_configs")

local function get_neotest_params()
  local dest = {}
  for _, conf in pairs(all_configs) do
    local adapter = conf["neotest_adapter"]
    if adapter ~= nil then
      vim.list_extend(dest, conf.plugs())
    end
  end
  return dest
end

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
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  },

  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    config = function()
      require "octo".setup {
        use_local_fs = true,
      }
    end
  },
  {
    "vim-test/vim-test",
    event = "BufEnter *",
  },
  {
    "nvim-neotest/neotest-vim-test",
    event = "BufEnter *",
    dependencies = "vim-test/vim-test"
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "vim-test/vim-test",
      "nvim-neotest/neotest-vim-test"
    },
    event = "BufEnter *",
    config = function()
      require("neotest").setup {
        adapters = {
           require("neotest-vim-test")({ allow_file_types = { "python" } }),
        }
      }
    end
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
  },
}

local function required_lang_plugs()
  local dest = {}
  for _, conf in pairs(all_configs) do
    local plugs = conf["plugs"]
    if plugs ~= nil then
      vim.list_extend(dest, conf.plugs())
    end
  end
  return dest
end

vim.list_extend(plugins, required_lang_plugs())

return plugins

