local function set_sign_icons()
	-- icons
	vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
	vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
	vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

	vim.fn.sign_define(
		"DapBreakpoint",
		{ text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
	)
	vim.fn.sign_define(
		"DapBreakpointCondition",
		{ text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
	)
	vim.fn.sign_define(
		"DapBreakpointRejected",
		{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
	)
	vim.fn.sign_define(
		"DapLogPoint",
		{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
	)
	vim.fn.sign_define(
		"DapStopped",
		{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
	)
end

local watch_widget = nil

local function watch_widget_toggle()
	if watch_widget == nil then
		local widgets = require("dap.ui.widgets")
		watch_widget = widgets.centered_float(widgets.scopes)
	end
	watch_widget.toggle()
end

local function set_keymaps()
	local map = vim.keymap.set
	map("n", "<M-S-j>", function()
		require("dap").continue()
	end, { desc = "continue debugger" })
	map("n", "<M-b>", function()
		require("dap").toggle_breakpoint()
	end, { desc = "toggle breakpoint" })
	map("n", "<M-S-b>", ":lua require('dap').toggle_breakpoint(", { desc = "conditional toggle breakpoint" })
	map("n", "<M-j>", function()
		require("dap").step_over()
	end, { desc = "debugger: step over" })
	map("n", "<M-l>", function()
		require("dap").step_into()
	end, { desc = "debugger: step into" })
	map("n", "<M-r>", function()
		require("dap").repl.toggle()
	end, { desc = "debugger: toggle repl" })
	map("n", "<Leader>lp", function()
		require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
	end, { desc = "debugger: log point breakpoint" })
	map("n", "<M-w>", watch_widget_toggle, { desc = "debugger: toggle watch window" })
	map("n", "<M-S-t>", function()
		require("dap").terminate()
	end, { desc = "debugger: terminate session" })
end

local setup = function()
	set_sign_icons()
	set_keymaps()
	require("dap").defaults.fallback.terminal_win_cmd = "50vsplit new"
end

return {
	-- dap
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function()
			setup()
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap" },
		opts = {},
	},
	{
		"Weissle/persistent-breakpoints.nvim",
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap" },
		opts = {
			load_breakpoints_event = { "BufReadPost" },
		},
	},
}
