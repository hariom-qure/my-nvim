local M = {}

M.get_linter = function(linters_by_ft)
	local fn = function()
		local result = require("lint").linters_by_ft
		require("lint").linters_by_ft = vim.tbl_deep_extend("force", result, linters_by_ft)
	end
	return fn
end

M.on_attach = function(client, bufnr)
	local nvlsp = require("nvchad.configs.lspconfig")
	nvlsp.on_attach(client, bufnr)

	-- need to override some nvchad mappings related to LSP
	-- this needs to be in on_attach
	-- https://github.com/NvChad/NvChad/issues/2854
	-- vim.keymap.set("n", "gd", "<cmd> Telescope lsp_definitions <CR>", { buffer = bufnr, desc = "Find definitions" })
	vim.keymap.set("n", "gr", "<cmd> Telescope lsp_references <CR>", { buffer = bufnr, desc = "Find References" })
end

M.get_lsp_setup = function(servers)
	-- return a function which returns a function
	-- which setups up your lsp with default settings
	local fn = function()
		local nvlsp = require("nvchad.configs.lspconfig")
		for _, server in ipairs(servers) do
			require("lspconfig")[server].setup({
				on_init = nvlsp.on_init,
				on_attach = M.on_attach,
				capabilities = nvlsp.capabilities,
			})
		end
	end
	return fn
end

return M
