---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<CR>"] = { "za", "toggle fold" },
    ["<leader>sr"] = { ":e ~/.scratchpad<CR>", "open scratchpad" }
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

return M

