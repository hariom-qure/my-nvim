local M = {}

M.treesitter = {
  ensure_installed = {
    "jsonnet"
  },
}

M.mason = {
  ensure_installed = {
    "jsonnet-language-server",
    "jsonnetfmt",
  },
}

M.null_ls = {
  sources = function (null_ls)
    local b = null_ls.builtins
    return {
      b.formatting.jsonnetfmt,
    }
  end
}

return M
