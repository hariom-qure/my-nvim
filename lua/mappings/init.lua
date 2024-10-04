require "nvchad.mappings"

require "mappings.old"

local map = vim.keymap.set

map("v", "<leader>fm", function()
  require("conform").format()
end, { desc = "Range formatting" })

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File formatting" })
