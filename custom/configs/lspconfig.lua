local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "jsonls", "nil_ls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

for _, conf in ipairs(require("custom.configs.all_configs")) do
  local fn = conf.setup_lsp
  if fn ~= nil then
    fn(on_attach, capabilities)
  end
end

