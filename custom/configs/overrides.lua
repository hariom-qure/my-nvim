local M = {}

local all_configs = require("custom.configs.all_configs")


local function extended_ensured_installed_inside_table(plug)
  local dest = {}

  for _, config in pairs(all_configs) do
    local plug_conf = config[plug] or {}
    local ensure_installed_table = plug_conf["ensure_installed"] or {}
    vim.list_extend(dest, ensure_installed_table)
  end
  return dest
end

M.treesitter = {
  ensure_installed = extended_ensured_installed_inside_table("treesitter"),
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = extended_ensured_installed_inside_table("mason"),
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

