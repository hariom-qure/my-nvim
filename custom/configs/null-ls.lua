local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local all_configs = require("custom.configs.all_configs")

local function get_all_conf_sources()
  local dest = {}
  for _, conf in pairs(all_configs) do
    local null_conf = conf.null_ls or nil
    if null_conf ~= nil then
      vim.list_extend(dest, null_conf.sources(null_ls))
    end
  end
  return dest
end

null_ls.setup {
  debug = true,
  sources = get_all_conf_sources(),
}

