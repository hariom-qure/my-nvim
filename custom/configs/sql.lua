local M = {}

M.treesitter = {
  ensure_installed = {
    "sql"
  },
}

M.mason = {
  ensure_installed = {
    "sqlfluff",
  },
}

M.null_ls = {
  sources = function (null_ls)
    local b = null_ls.builtins
    return {
      b.diagnostics.sqlfluff.with({
        extra_args = { "--dialect", "postgres" },
      }),
      b.formatting.sqlfluff.with({
        extra_args = { "--dialect", "postgres" },
      }),
    }
  end
}

return M
