return {
  -- git
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "ruifm/gitlinker.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    config = function()
      require("gitlinker").setup()
    end,
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require("octo").setup {
        use_local_fs = true,
        suppress_missing_scope = {
          projects_v2 = true,
        },
      }
      vim.treesitter.language.register("markdown", "octo")
    end,
  },
}
