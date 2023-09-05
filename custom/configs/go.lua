local M = {}

M.treesitter = {
  ensure_installed = {
    "go",
  },
}

M.mason = {
  ensure_installed = {
    "gopls",
    "golines",
    "gofumpt",
    "goimports-reviser",
    "delve",
  },
}

M.null_ls = {
  sources = function (null_ls)
    local b = null_ls.builtins
    return {
      b.formatting.gofumpt,
      b.formatting.goimports_reviser,
      b.formatting.golines,
    }
  end
}

M.setup_lsp = function(on_attach, capabilities)
  local util = require "lspconfig/util"
  require("lspconfig").gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"gopls"},
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  }
end

M.plugs = function()
  return {
    {
      "leoluz/nvim-dap-go",
      ft = "go",
      dependencies = "mfussenegger/nvim-dap",
      opts = {
        delve = {
          path = vim.fn.stdpath("data") .. "/mason/packages/delve/dlv"
        }
      }
    },
  }
end

return M

