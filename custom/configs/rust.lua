M = {}

M.plugs = function()
  return {
    {
      'simrat39/rust-tools.nvim',
      dependencies = {
        'neovim/nvim-lspconfig',
        'nvim-lua/plenary.nvim',
        'mfussenegger/nvim-dap',
      },
      event = "BufRead *.rs",
      config = function()
        require("rust-tools").setup {
          server = {
            on_attach = function(_, bufnr)
              vim.keymap.set(
                "n",
                "<M-k>",
                require('rust-tools').hover_actions.hover_actions,
                { buffer = bufnr }
              )
              vim.keymap.set(
                "n",
                "<Leader>a",
                require('rust-tools').code_action_group.code_action_group,
                { buffer = bufnr }
              )
            end,
          },
        }
      end
    },
  }
end

return M
