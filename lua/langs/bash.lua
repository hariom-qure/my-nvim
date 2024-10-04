local M = {}

M.ts_langs = function()
  return { "bash" }
end

M.conform = function()
  return require("project_settings").conform("bash", {
    formatters_by_ft = {
      bash = { "shfmt" },
    },
  })
end

M.lint = function()
  require("project_settings").lint("bash", require("defaults").get_linter { bash = { "shellcheck" } })
end

return M
