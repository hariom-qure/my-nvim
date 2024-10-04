require "nvchad.options"

local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.exrc = true
opt.termguicolors = true
opt.colorcolumn = "89"

autocmd({ "BufRead" }, {
  pattern = { "*.md", "README" },
  command = "lua require('render-markdown').enable()",
})

autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  command = "normal! zx",
})
autocmd({ "BufRead", "BufNew" }, {
  pattern = { "Jenkinsfile", "*.Jenkinsfile" },
  command = "setf groovy",
})
autocmd({ "BufRead", "BufNew" }, {
  pattern = { "*.authzed", "*.zed", "*.azd" },
  command = "setf authzed",
})

autocmd({ "BufRead" }, {
  pattern = { "*" },
  command = "hi DiffAdd guifg=NONE guibg=#203524",
})
autocmd({ "BufRead" }, {
  pattern = { "*" },
  command = "hi DiffDelete guifg=NONE guibg=#381e1d",
})

local function paste()
  return {
    vim.fn.split(vim.fn.getreg "", "\n"),
    vim.fn.getregtype "",
  }
end

local function setClipboardForSsh()
  -- disabled right now
  -- use this if you want later
  -- this will allow you to copy to current laptops clipboard on ssh connections
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy "+",
      ["*"] = require("vim.ui.clipboard.osc52").copy "*",
    },
    paste = {
      ["+"] = paste,
      ["*"] = paste,
    },
  }
end
