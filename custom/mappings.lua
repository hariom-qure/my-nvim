---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<CR>"] = { "za", "toggle fold" },
    ["<leader>sr"] = { ":e ~/.scratchpad<CR>", "open scratchpad" },
    ["<M-+>"] = { ":resize +2<cr>", "increase window size vertically" },
    ["<M-_>"] = { ":resize -2<cr>", "decrease window size vertically" },
    ["<M-=>"] = { ":vertical resize +2<cr>", "increase window size" },
    ["<M-->"] = { ":vertical resize -2<cr>", "decrease window size" },
  },
}

-- more keybinds!

M.telescope = {
  n = {
    ["gd"] = { "<cmd> Telescope lsp_definitions <CR>", "Find definitions" },
    ["gr"] = { "<cmd> Telescope lsp_references <CR>", "Find references" },
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<C-S-f>"] = { "<cmd> Telescope live_grep <CR>", "Find text" },
  }
}

-- M.dap = {
--   n = {
--     ["<leader>dc"] = { ":DapContinue<cr>", "continue debugger" },
--     ["<leader>dt"] = { ":DapToggleBreakpoint<cr>", "toggle breakpoint" },
--     ["<leader>dso"] = { ":DapStepOver<cr>", "debugger: step over" },
--     ["<leader>dsi"] = { ":DapStepInto<cr>", "debugger: step into" },
--     ["<leader>dT"] = { ":DapTerminate<cr>", "debugger: step into" },
--   }
-- }
--
M.dap = require("custom.configs.dap").keymaps

return M

