local util = require "zenbones.util"
local lush = require "lush"
local hsluv = lush.hsluv

local M = {}

M.light = util.palette_extend({
	bg = hsluv(0, 0, 94), -- sand
	fg = hsluv(0, 0, 22), -- stone
}, "light")

M.dark = util.palette_extend({
	-- Background & Foreground
	bg = hsluv "#0a0a0a", -- sand
	fg = hsluv "#c1c1c1", -- stone
	-- Whites, grays and Blacks
	metal_white = hsluv "#FFFFFF",
	metal_mercury = hsluv "#E4E4E4",
	metal_silver = hsluv "#C1C1C1",
	metal_gray6 = hsluv "#AAABAB",
	metal_gray5 = hsluv "#999999",
	metal_gray4 = hsluv "#888888",
	metal_gray3 = hsluv "#333333",
	metal_gray2 = hsluv "#222222",
	metal_gray1 = hsluv "#121212",
	metal_gray0 = hsluv "#0a0a0a",
	metal_black = hsluv "#000000",
	-- Warmish
	metal_stone = hsluv "#9B8D7F",
	metal_americano = hsluv "#8C7F70",
	-- Bluish
	metal_electric = hsluv "#556677",
	metal_steel = hsluv "#5F8787",
	-- Greenish
	metal_nile = hsluv "#777755",
	metal_ponni = hsluv "#626B67",
	-- Orangish
	metal_barthelo = hsluv "#FBCB97",
	metal_barthory = hsluv "#E78A53",
	-- Redish
	metal_orchid = hsluv "#DD9999",
	metal_rose = hsluv "#A06666",
	metal_rust = hsluv "#974B46",
	metal_thorn = hsluv "#79241F",
}, "dark")

return M
