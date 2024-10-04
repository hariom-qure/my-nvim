local M = {}

M.lsp = function(lang, default_lsp)
  -- setup the lsp config of your lang
  -- if `exrc.lsp[lang]` is present, its called with no arguments
  -- its required to setup the whole lsp server
  -- otherwise the lang default is used
  local settings = vim.g.project_settings
  if settings and settings.lsp and settings.lsp[lang] then
    settings.lsp[lang]()
  else
    default_lsp()
  end
end

M.conform = function(lang, default_settings)
  -- return the project settings if they exist else the default_settings
  -- project_settings are found in attribute `.conform` in exrc
  -- you should put the whole conform configuration there which is merged with other conform configs
  -- langs should generally provide defaults
  local settings = vim.g.project_settings
  if settings and settings.conform and settings.conform[lang] then
    return settings.conform[lang]
  else
    return default_settings
  end
end

M.dap = function(lang)
  -- call the function `exrc.dap[lang]()` if it exists
  -- the function would be called after the language specific dap extension is loaded
  local settings = vim.g.project_settings
  if settings and settings.dap and settings.dap[lang] then
    settings.dap[lang]()
  end
end

M.lint = function(lang, default_fn)
  -- call the function `exrc.lint[lang]()` if it exists
  -- the function would be called after the language specific dap extension is loaded
  -- this function would be called when the lang buffer is opened the first time
  -- we manage the lang to buf mapping
  -- there is nothing new here, the function should do exactly as nvim-lint specifies
  -- make sure you do not clear other langs configs
  -- use vim.tbl_deep_extend()
  local settings = vim.g.project_settings
  if settings and settings.lint and settings.lint[lang] then
    settings.lint[lang]()
  else
    default_fn()
  end
end

M.neotest = function(lang, default_fn)
  -- tweak the adapters of your neotest configuration
  -- its fetched with `exrc.neotest[lang].adapters()` function
  -- which is supposed to return a table of adapters expected by neotest
  local settings = vim.g.project_settings

  if settings and settings.neotest and settings.neotest[lang] and settings.neotest[lang].adapters then
    return settings.neotest[lang].adapters()
  else
    return default_fn()
  end
end

return M
