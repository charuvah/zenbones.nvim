local util = require "zenbones.util"
local palette = require "metalbones.palette"

local M = {}

local fbg = { bg = palette.metal_gray0, fg = palette.metal_gray5 }
for k, v in pairs(palette) do
	fbg[k] = v
end

M.palette = util.palette_extend(fbg, "light")

M.syntax = {
	number = palette.metal_rust,
}

return M
