local M = {}

for i, lang in ipairs(require "langs") do
  if lang.plugs ~= nil then
    vim.list_extend(M, lang.plugs())
  end
end

return M
