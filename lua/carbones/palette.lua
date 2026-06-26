local lush = require "lush"
local hsluv = lush.hsluv

local palette = {
	-- carbon weave darks (backgrounds and shadow layers)
	carb_raw = hsluv "#232323", -- Carbon Raw (deepest shadow)
	carb_standard = hsluv "#262626", -- Carbon Fiber Standard (main bg)
	carb_deep = hsluv "#252626", -- Carbon Fiber Deep Muted (faint blue-green tint)
	carb_warm = hsluv "#282625", -- Carbon Fiber Warm (faint earthy tint)
	carb_cool = hsluv "#2E2E2E", -- Carbon Fibre Cool (slightly lighter)

	-- mid-tones (text and highlight range)
	carb_graphite = hsluv "#474A51", -- Graphite / Metallic Highlight
	carb_glint = hsluv "#4B4E53", -- Reflective Glint

	-- pure anchors
	carb_black = hsluv "#000000",
	carb_white = hsluv "#ffffff",

	-- composite accent strands (available for selective use)
	-- each pair: woven strand + deep interlocking shadow
	carb_titanium = hsluv "#244464", -- Titanium Blue
	carb_teal = hsluv "#1B2E2A", -- Teal Titanium
	carb_olive = hsluv "#1D2B24", -- Olive Titanium
	carb_gold = hsluv "#2A271E", -- Muted Gold Titanium
	carb_bronze = hsluv "#2A211D", -- Bronze Titanium
	carb_oxblood = hsluv "#281919", -- Oxblood Titanium
	carb_plum = hsluv "#21151D", -- Plum Titanium
}

return palette
