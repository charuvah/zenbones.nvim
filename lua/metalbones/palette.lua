local lush = require "lush"
local hsluv = lush.hsluv

local palette = {
	-- whites, grays and blacks
	metal_white = hsluv "#ffffff",
	metal_mercury = hsluv "#e4e4e4",
	metal_silver = hsluv "#c1c1c1",
	metal_gray6 = hsluv "#aaabab",
	metal_gray5 = hsluv "#999999",
	metal_gray4 = hsluv "#888888",
	metal_gray3 = hsluv "#333333",
	metal_gray2 = hsluv "#222222",
	metal_gray1 = hsluv "#121212",
	metal_gray0 = hsluv "#0a0a0a",
	metal_black = hsluv "#000000",
	-- warmish
	metal_stone = hsluv "#9b8d7f",
	metal_americano = hsluv "#8c7f70",
	-- bluish
	metal_electric = hsluv "#556677",
	metal_steel = hsluv "#5f8787",
	-- greenish
	metal_nile = hsluv "#777755",
	metal_ponni = hsluv "#626b67",
	-- orangish
	metal_barthelo = hsluv "#fbcb97",
	metal_barthory = hsluv "#e78a53",
	-- redish
	metal_orchid = hsluv "#dd9999",
	metal_rose = hsluv "#a06666",
	metal_rust = hsluv "#974b46",
	metal_thorn = hsluv "#79241f",
}

return palette
