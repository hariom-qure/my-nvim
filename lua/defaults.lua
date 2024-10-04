local M = {}

M.get_linter = function(ft_by_linters)
  local fn = function()
    local result = require("lint").linters_by_ft
    require("lint").linters_by_ft = vim.tbl_deep_extend("force", result, ft_by_linters)
  end
  return fn
end

M.get_lsp_setup = function(servers)
  -- return a function which returns a function
  -- which setups up your lsp with default settings
  local fn = function()
    local nvlsp = require "nvchad.configs.lspconfig"
    for i, server in ipairs(servers) do
      require("lspconfig")[server].setup {
        on_init = nvlsp.on_init,
        on_attach = nvlsp.on_attach,
        capabilities = nvlsp.capabilities,
      }
    end
  end
  return fn
end

return M
