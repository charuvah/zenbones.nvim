local colors_name = "metalbones"
vim.g.colors_name = colors_name

local lush = require "lush"
local hsluv = lush.hsluv
local util = require "zenbones.util"

local bg = vim.o.background

local palette
if bg == "light" then
else
	palette = util.palette_extend({
		khold = hsluv "#974b46",
		nile = hsluv "#777755",
	}, bg)
end

local generator = require "zenbones.specs"
local base_specs = generator.generate(palette, bg, generator.get_global_config(colors_name, bg))

local specs = lush.extends({ base_specs }).with(function()
	return {
		String { base_specs.String, fg = palette.nile },
	}
end)

lush(specs)
