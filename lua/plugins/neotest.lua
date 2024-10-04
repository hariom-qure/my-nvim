local get_deps = function()
  local default_deps = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/nvim-nio",
  }
  local deps = default_deps
  for i, lang in ipairs(require "langs") do
    if lang.neotest ~= nil then
      local spec = lang.neotest()
      vim.list_extend(deps, spec.dependencies())
    end
  end
  return deps
end

local get_adapters = function()
  local adapters = {}
  for i, lang in ipairs(require "langs") do
    if lang.neotest ~= nil then
      local spec = lang.neotest()
      vim.list_extend(adapters, spec.adapters())
    end
  end
  return adapters
end

local set_keymaps = function()
  local map = vim.keymap.set
  map("n", "<leader>nt", function()
    require("neotest").run.run()
  end, { desc = "test: run nearest" })
  map("n", "<leader>nd", function()
    require("neotest").run.run { strategy = "dap" }
  end, { desc = "test: run nearest in dap" })
  map("n", "<leader>nT", function()
    require("neotest").run.run(vim.fn.expand "%")
  end, { desc = "test: run file" })
  map("n", "<leader>ns", function()
    require("neotest").summary.open()
  end, { desc = "test: summary nearest" })
  map("n", "<leader>no", function()
    require("neotest").output.open { enter = true }
  end, { desc = "test: output nearest" })
end

return {
  { "nvim-neotest/nvim-nio" },
  {
    "nvim-neotest/neotest",
    dependencies = get_deps(),
    event = "BufEnter *",
    config = function()
      require("neotest").setup {
        adapters = get_adapters(),
      }
      set_keymaps()
    end,
  },
}
