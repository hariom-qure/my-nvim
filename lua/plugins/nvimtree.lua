local default_config = require("nvchad.configs.nvimtree")
local config = vim.tbl_deep_extend("force", default_config, {
  git = {
    ignore = false,
  },
})


return {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return config
    end,
}
