local M = {}

M.ts_langs = function()
  return { "lua" }
end

M.conform = function()
  return require("project_settings").conform("lua", {
    formatters_by_ft = {
      lua = { "stylua" },
    },
  })
end

M.lsp = function()
  require("project_settings").lsp("lua", require("defaults").get_lsp_setup { "lua_ls" })
end

M.lint = function()
  require("project_settings").lint("lua", require("defaults").get_linter { lua = { "luacheck" } })
end

return M
