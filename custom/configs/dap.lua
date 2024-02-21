local M = {}

local function set_sign_icons()
  vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
  vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
  vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

  vim.fn.sign_define('DapBreakpoint', { text='🔴', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
  vim.fn.sign_define('DapBreakpointCondition', { text='🔴', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
  vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
  vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
  vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })
end

M.setup = function()
  set_sign_icons()
  require("dap").defaults.fallback.terminal_win_cmd = '50vsplit new'
end

M.watch_widget = nil

local function watch_widget_toggle()
  if M.watch_widget == nil then
    local widgets = require("dap.ui.widgets")
    M.watch_widget = widgets.centered_float(widgets.scopes)
  end
  M.watch_widget.toggle()
end

M.keymaps = {
  n = {
    ["<M-S-j>"] = { function() require("dap").continue() end, "continue debugger" },
    ["<M-S-l>"] = { function() require("dap").continue() end, "run last session" },
    ["<M-b>"] = { function() require("dap").toggle_breakpoint() end, "toggle breakpoint" },
    ["<M-S-b>"] = { ":lua require('dap').toggle_breakpoint(", "custom toggle breakpoint" },
    ["<M-j>"] = { function() require("dap").step_over() end, "debugger: step over" },
    ["<M-l>"] = { function() require("dap").step_into() end, "debugger: step into" },
    ["<M-r>"] = { function() require('dap').repl.toggle() end, "debugger: toggle repl" },
    ['<Leader>lp'] = { function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, "log point" },
    ["<M-w>"] = { watch_widget_toggle, "debugger: toggle watch window"},
    ["<M-S-t>"] = { function() require("dap").terminate() end, "debugger: terminate session" },
  }
}

return M
