return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      local langs = require "langs"
      for i, lang in ipairs(langs) do
        if lang.lsp ~= nil then
          lang.lsp()
        end
      end
    end,
  },
}
