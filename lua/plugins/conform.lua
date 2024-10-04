return {
  {
    "stevearc/conform.nvim",
    config = function()
      local langs = require "langs"
      local result = {}
      for i, lang in ipairs(langs) do
        if lang.conform ~= nil then
          result = vim.tbl_deep_extend("force", result, lang.conform())
        end
      end
      require("conform").setup(result)
    end,
  },
}
