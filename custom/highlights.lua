-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  DiffAdd = { bg = "#203524" },
  DiffDelete = { bg = "#381e1d" },
}

vim.cmd("hi DiffAdd guibg=#203524")
vim.cmd("hi DiffDelete guibg=#381e1d")

return M
