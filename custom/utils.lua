local M = {}

M.pretty_table = function(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. M.pretty_table(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

M.get_dap_configuration = function(lang)
  local settings = vim.g.project_settings
  if settings and settings.dap and settings.dap[lang] then
    return settings.dap[lang]
  end
  return nil
end

M.get_neotest_configuration = function(lang)
  local settings = vim.g.project_settings

  if settings and settings.neotest and settings.neotest[lang] then
    return settings.neotest[lang]
  end
  return nil
end

return M

