local lush = require "lush"
local hsluv = lush.hsluv

local palette = {
	-- grays
	retro_white = hsluv "#ffffff",
	retro_black = hsluv "#000000",

	-- darks
	retro_dark1 = hsluv "#060b11",
	retro_dark2 = hsluv "#0c1023",
	retro_dark3 = hsluv "#10182e",
	retro_dark4 = hsluv "#182634",

	-- mids
	retro_mid1 = hsluv "#420d39",
	retro_mid2 = hsluv "#531347",
	retro_mid3 = hsluv "#851569",
	retro_mid4 = hsluv "#a31a48",

	-- brights
	retro_bright1 = hsluv "#5e1a20",
	retro_bright2 = hsluv "#8d402f",
	retro_bright3 = hsluv "#be794f",
	retro_bright4 = hsluv "#e3b47a",

	-- grays
	retro_gray1 = hsluv "#40464a",
	retro_gray2 = hsluv "#90969b",
	retro_gray3 = hsluv "#b0b6bb",
	retro_gray4 = hsluv "#e0e6ee",
}

return palette
