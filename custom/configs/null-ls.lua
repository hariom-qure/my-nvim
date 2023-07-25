local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end


local py_config = require("custom.configs.python")
null_ls.setup {
  debug = true,
  sources = py_config.null_ls.sources(),
}

