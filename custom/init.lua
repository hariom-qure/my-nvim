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
autocmd(
  {"BufRead"},
  {
    pattern = {"*"},
    command = "hi DiffAdd guifg=NONE guibg=#203524"
  }
)
autocmd(
  {"BufRead"},
  {
    pattern = {"*"},
    command = "hi DiffDelete guifg=NONE guibg=#381e1d"
  }
)
vim.treesitter.language.register('markdown', 'octo')

-- vim.api.nvim_create_user_command("Ocrev", function()
--   vim.cmd("Octo review start")
--   vim.cmd("hi DiffAdd guibg=#203524")
--   vim.cmd("")
-- end, {})
--
--
-- vim.api.nvim_create_user_command("Ocres", function()
--   vim.cmd("Octo review resume")
--   vim.cmd("hi DiffAdd guibg=#203524")
--   vim.cmd("hi DiffDelete guibg=#381e1d")
-- end, {})
