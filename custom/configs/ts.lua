local M = {}

M.treesitter = {
  ensure_installed = {
    "typescript",
    "javascript",
  }
}

M.mason = {
  ensure_installed = {
    "eslint-lsp",
    "typescript-language-server",
    "prettier",
  },
}

M.null_ls = {
  sources = function (null_ls)
    return {
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.formatting.prettier,
    }
  end
}
return M
