local lush = require "lush"
local hsluv = lush.hsluv

local palette = {
	-- neutrals
	bat_black = hsluv "#080808", -- Midnight Shadow
	bat_white = hsluv "#ffffff",
	bat_fog   = hsluv "#b8c0c6", -- light neutral for light mode

	-- darks
	bat_shadow = hsluv "#1d2434", -- Sky & Atmosphere Accent

	-- mids
	bat_slate  = hsluv "#7c878e", -- Dark Deco Slate
	bat_purple = hsluv "#44496f", -- Joker Suit Purple

	-- accents
	bat_blue    = hsluv "#003da5", -- Gotham Blue
	bat_gold    = hsluv "#f1be48", -- Vintage Gold
	bat_amber   = hsluv "#efbe7d", -- Warm Amber
	bat_crimson = hsluv "#c22a2a", -- Poison / Crimson Highlight
}

return palette
