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
    "mypy",
  },
}

-- LSP
require("lspconfig").pyright.setup {
  on_attach = require("plugins.configs.lspconfig").on_attach,
  capabilities = require("plugins.configs.lspconfig").capabilities,
  settings = {
    python = {
      analysis = {
        diagnosticSeverityOverrides = {
          reportTypedDictNotRequiredAccess = "none"
        }
      }
    }
  }
}


M.null_ls = {
  sources = function ()
    local present, null_ls = pcall(require, "null-ls")
    if not present then
      return M
    end
    local b = null_ls.builtins
    return {
      b.formatting.black,
    }
  end
}

return M

