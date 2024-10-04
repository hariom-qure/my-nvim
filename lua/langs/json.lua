local M = {}

M.ts_langs = function()
  return { "json" }
end

M.conform = function()
  return require("project_settings").conform("json", {
    formatters_by_ft = {
      json = { "jq" },
    },
  })
end

M.lsp = function()
  require("project_settings").lsp("json", require("defaults").get_lsp_setup { "jsonls" })
end

return M
