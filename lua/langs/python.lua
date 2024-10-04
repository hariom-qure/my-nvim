local M = {}

M.ts_langs = function()
  return { "python" }
end

M.conform = function()
  return require("project_settings").conform("python", {
    formatters_by_ft = {
      python = { "black" },
    },
  })
end

M.lsp = function()
  require("project_settings").lsp("python", require("defaults").get_lsp_setup { "pyright" })
end

M.mason = function()
  return {
    "debugpy",
  }
end

M.plugs = function()
  return {
    {
      "mfussenegger/nvim-dap-python",
      dependencies = { "mfussenegger/nvim-dap" },
      event = "BufRead *.py",
      config = function()
        require("dap-python").setup(vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python")
        require("project_settings").dap "python"
      end,
    },
    {
      "nvim-neotest/neotest-python",
      event = "BufEnter *.py",
    },
  }
end

local neotest_default_adapters = function()
  return {
    require "neotest-python" {
      dap = { justMyCode = false },
    },
  }
end

M.neotest = function()
  return {
    dependencies = function()
      return { "nvim-neotest/neotest-python" }
    end,
    adapters = function()
      return require("project_settings").neotest("python", neotest_default_adapters)
    end,
  }
end

return M
