local M = {}

local py_configs = require("custom.configs.python")

M.treesitter = {
  ensure_installed = py_configs.treesitter.ensure_installed,
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = py_configs.mason.ensure_installed,
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.cmp = {
  sorting = {
    comparators = {
      require("cmp").config.compare.score,
    }
  }
}

M.nvimtree = {
  filters = {
    dotfiles = true,
  },
  git = {
    ignore = false,
  },
}

return M

