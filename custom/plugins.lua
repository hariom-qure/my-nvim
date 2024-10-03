local overrides = require("custom.configs.overrides")
local all_configs = require("custom.configs.all_configs")


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
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.authzed = {
        install_info = {
          url = "https://github.com/mleonidas/tree-sitter-authzed", -- local path or git repo
          files = { "src/parser.c" },
          generate_requires_npm = false,
          requires_generate_from_grammar = false,
          -- optional entries:
          branch = "main",    -- default branch in case of git repo if different from master
        },
        filetype = "authzed", -- if filetype does not match the parser name
      }
    end,
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
  {
    "NvChad/nvterm",
    enabled = false,
  },
  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  {
    "tpope/vim-surround",
    event = "BufEnter *",
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>tr0",
        "<cmd>Trouble diagnostics toggle focus=false filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      }
    }
  },

  -- telescope
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  },

  -- dap
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function()
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

  -- testing utilities plugins
  { "nvim-neotest/nvim-nio" },
  {
    "vim-test/vim-test",
    event = "BufEnter *",
  },
  {
    "nvim-neotest/neotest-python",
    event = "BufEnter *.py",
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
      "nvim-neotest/neotest-python",
      "nvim-neotest/nvim-nio",
    },
    event = "BufEnter *",
    config = function()
      require("neotest").setup {
        adapters = {
          require("neotest-python"),
        }
      }
    end
  },

  -- git
  {
    "sindrets/diffview.nvim",
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    'ruifm/gitlinker.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    config = function()
      require "gitlinker".setup()
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end,
    event="VeryLazy",
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
        suppress_missing_scope = {
          projects_v2 = true,
        }
      }
    end
  },


  -- markdown
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
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
