local M = {}

M.mason = {
  ensure_installed = {
    "shellcheck",
  }
}

M.null_ls = {
  sources = function (null_ls)
    return { null_ls.builtins.code_actions.shellcheck }
  end
}

return M
