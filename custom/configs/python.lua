local M = {}

M.treesitter = {
  ensure_installed = {
    "python",
    "lua",
  },
}

M.mason = {
  ensure_installed = {
    "pyright",
    "black",
    "debugpy",
    "pylint",
  },
}

M.null_ls = {
  sources = function (null_ls)
    local b = null_ls.builtins
    return {
      b.formatting.black,
    }
  end
}

M.setup_lsp = function(on_attach, capabilities)
  require("lspconfig").pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          diagnosticSeverityOverrides = {
            reportTypedDictNotRequiredAccess = "none"
          },
          extraPaths = {"/home/users/hariom.narang/work/workspace/services/qure_platform_api/hct_api"},
        },
      }
    }
  }
end

M.plugs = function()
  return {
    {
      'mfussenegger/nvim-dap-python',
      dependencies = { "mfussenegger/nvim-dap" },
      event = "BufRead *.py",
      config = function()
        -- require('dap-python').setup()
        require('dap-python').setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
        local dap = require("dap")
        local project_specific = require("custom.utils").get_dap_configuration("python")
        if project_specific then
          vim.list_extend(dap.configurations.python, project_specific)
        end
      end
    },
  }
end

M.neotest_adapter = function()
  local ok, mod = pcall(require, "neotest-python")
  if not ok then
    return nil
  else
    local project_specific = require("custom.utils").get_neotest_configuration("python")
    local params = {}
    if project_specific then
      params = project_specific
    end
    return mod(params)
  end
end

return M

