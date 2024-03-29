local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.exrc = true
opt.termguicolors = true
opt.colorcolumn = "89"

autocmd(
  {"BufWinEnter"},
  {
    pattern = {"*"},
    command = "normal! zx"
  }
)
autocmd(
  {"BufRead", "BufNew"},
  {
    pattern = {"Jenkinsfile", "*.Jenkinsfile"},
    command = "setf groovy",
  }
)

