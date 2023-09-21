local M = {}

M.treesitter = {
  ensure_installed = {
    "c",
    "cpp",
  },
}

M.mason = {
  ensure_installed = {
    "clangd",
    "clangd-extensions"
  },
}

M.null_ls = {
  sources = function (null_ls)
    return {}
  end
}

M.setup_lsp = function(on_attach, capabilities)
  require'lspconfig'.clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

M.plugs = function()
  return {}
end

return M

