-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
local vim = vim
local opt = vim.opt
local api = vim.api

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99

local function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        api.nvim_command('augroup '..group_name)
        api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            api.nvim_command(command)
        end
        api.nvim_command('augroup END')
    end
end

local autocmds = {
  open_folds = {
    {"BufWinEnter", "*", "normal zx"}
  },
}

nvim_create_augroups(autocmds)
vim.api.nvim_create_autocmd(
  {"BufRead", "BufNew"},
  {
    pattern = {"Jenkinsfile", "*.Jenkinsfile"},
    command = "setf groovy",
  }
)

