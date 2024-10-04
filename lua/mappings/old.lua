local old_mappings = {}

old_mappings.general = {
  n = {
    ["<CR>"] = { "za", "toggle fold" },
    ["<leader>sr"] = { ":e ~/.scratchpad<CR>", "open scratchpad" },
    -- window resizing
    ["<M-+>"] = { ":resize +2<cr>", "increase window size vertically" },
    ["<M-_>"] = { ":resize -2<cr>", "decrease window size vertically" },
    ["<M-=>"] = { ":vertical resize +2<cr>", "increase window size" },
    ["<M-->"] = { ":vertical resize -2<cr>", "decrease window size" },
    -- list moving
    ["]q"] = { ":cnext<cr>", "quickfix list: next" },
    ["[q"] = { ":cprev<cr>", "quickfix list: previous" },
    ["]b"] = { ":bnext<cr>", "buffer list: previous" },
    ["[b"] = { ":bprev<cr>", "buffer list: previous" },

    ["<M-k>"] = { ":lua vim.diagnostic.open_float()<CR>", "show diagnostics" },
  },
  t = {
    ["<C-[>"] = { "<C-\\><C-n>", "escape from terminal" },
  },
}

old_mappings.telescope = {
  n = {
    ["gd"] = { "<cmd> Telescope lsp_definitions <CR>", "Find definitions" },
    ["gr"] = { "<cmd> Telescope lsp_references <CR>", "Find references" },
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<C-S-f>"] = { "<cmd> Telescope live_grep <CR>", "Find text" },
    ["<leader>fg"] = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Ripgrep with args" },
  },
}

-- old_mappings.neotest = {
--   n = {
--     ["<leader>nt"] = { "<cmd>lua require('neotest').run.run()<cr>", "Run nearest test" },
--     ["<leader>nd"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Run nearest test in dap" },
--     ["<leader>nT"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run nearest test" },
--     ["<leader>ns"] = { "<cmd>lua require('neotest').summary.open()<cr>", "Summary of nearest test" },
--     ["<leader>no"] = { "<cmd>lua require('neotest').output.open({enter = true})<cr>", "output of nearest test" },
--   }
-- }
--
-- old_mappings.dap = require("custom.configs.dap").keymaps

for name, maps in pairs(old_mappings) do
  for mode, data in pairs(maps) do
    for key, val in pairs(data) do
      vim.keymap.set(mode, key, val[1], { desc = val[2] })
    end
  end
end
