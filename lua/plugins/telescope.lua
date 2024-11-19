return {
  {
		"nvim-telescope/telescope-dap.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap" },
		config = function()
      require("telescope").load_extension("dap")
		end,
  },
	{
		"nvim-telescope/telescope-live-grep-args.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope").load_extension("live_grep_args")
		end,
	},
}
