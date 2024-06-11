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
          branch = "main", -- default branch in case of git repo if different from master
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
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup{
        open_mapping = [[<C-\>]],
        direction = 'horizontal',
        shade_terminals = true,
        autochdir = true,
      }
      vim.keymap.set("t", [[<C-\>]], [[<C-\><C-n>]], { silent = true })
      vim.keymap.set("n", "<leader>pt", ":TermSelect\n")
      vim.keymap.set("n", "<leader>tn", ":ToggleTerm direction=horizontal name=")
    end,
    event = "VeryLazy"
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
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  },
  {
    "ryanmsnyder/toggleterm-manager.nvim",
    dependencies = {
      "akinsho/nvim-toggleterm.lua",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
    },
    config = true,
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
          -- require("neotest-vim-test")({ allow_file_types = { "python" } }),
        }
      }
    end
  },
  { "nvim-neotest/nvim-nio" },
  {
    "sindrets/diffview.nvim",
    lazy = false,
  },
  {
    'nvim-pack/nvim-spectre',
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
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
