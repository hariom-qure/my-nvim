require "nvchad.mappings"

require "mappings.old"

local map = vim.keymap.set

map("v", "<leader>fm", function()
  require("conform").format()
end, { desc = "Range formatting" })

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File formatting" })

local nomap = vim.keymap.del

-- rmeove nvchad mapping for tab, the default vim one lets us jump back
-- when Tab is reassigned, it also reassigns <Ctrl-i>
nomap("n", "<Tab>")
