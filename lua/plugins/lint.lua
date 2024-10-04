return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      local langs = require "langs"
      for i, lang in ipairs(langs) do
        if lang.lint ~= nil then
          lang.lint()
        end
      end
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        pattern = { "*" },
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
    event = "VeryLazy",
  },
}
