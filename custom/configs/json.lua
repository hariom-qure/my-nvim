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

return M
