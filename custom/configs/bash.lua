local M = {}

M.mason = {
  ensure_installed = {
    "shellcheck",
    "shfmt"
  }
}

M.null_ls = {
  sources = function (null_ls)
    return {
      null_ls.builtins.code_actions.shellcheck,
      null_ls.builtins.formatting.shfmt,
    }
  end
}

return M
