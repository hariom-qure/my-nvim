return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      keymap = {
        accept = "<M-c>",
        next = "<M-f>",
        prev = "<M-a>",
        dismiss = "<M-d>",
      },
    }
  },
  -- config = function (opts)
  --   require("copilot").setup(opts)
  --   vim.api.nvim_set_var("copilot_status", "")
  --   local api = require("copilot.api")
  --   api.register_status_notification_handler(function (data)
  --     vim.api.nvim_set_var("copilot_status", data.status)
  --   end)
  -- end
}

-- vim.api.nvim_set_var("copilot_status", "")
