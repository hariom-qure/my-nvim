-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "radium",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

local get_mason_pkgs = function()
  local result = {}
  for i, lang in ipairs(require "langs") do
    if lang.mason then
      vim.list_extend(result, lang.mason())
    end
  end
  return result
end

M.mason = {
  pkgs = get_mason_pkgs(),
}

return M
