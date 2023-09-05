local M = {}

M.treesitter = {
  ensure_installed = {
    "json"
  },
}

M.mason = {
  ensure_installed = {
    "json-lsp",
    "jq"
  },
}

M.null_ls = {
  sources = function (null_ls)
    local b = null_ls.builtins
    return {
      b.formatting.jq,
    }
  end
}

-- M.setup_lsp = function(on_attach, capabilities)
--   require("lspconfig").pyright.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     settings = {
--       python = {
--         analysis = {
--           diagnosticSeverityOverrides = {
--             reportTypedDictNotRequiredAccess = "none"
--           }
--         }
--       }
--     }
--   }
-- end
--
-- M.plugs = function()
--   return {
--     {
--       'mfussenegger/nvim-dap-python',
--       dependencies = { "mfussenegger/nvim-dap" },
--       event = "BufRead *.py",
--       config = function()
--         require('dap-python').setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
--         local dap = require("dap")
--         local project_specific = require("custom.utils").get_dap_configuration("python")
--         if project_specific then
--           vim.list_extend(dap.configurations.python, project_specific)
--         end
--       end
--     },
--   }
-- end

return M

