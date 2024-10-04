return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local result = require "nvchad.configs.treesitter"
      local ensure_installed = {}
      local langs = require "langs"
      for i, lang in ipairs(langs) do
        if lang.ts_langs ~= nil then
          vim.list_extend(ensure_installed, lang.ts_langs())
        end
      end
      result.ensure_installed = ensure_installed
      return result
    end,
  },
}
