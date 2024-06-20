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
		metalred = hsluv "#835d5a",
		metalgreen = hsluv "#628282",
		metalblue = hsluv "#5f81a5",
		metalgray1 = hsluv "#121212",
		metalgray2 = hsluv "#222222",
		metalgray3 = hsluv "#4f4f4f",
		metalgray4 = hsluv "#5f5f5f",
		metalgray5 = hsluv "#919191",
		metalgray6 = hsluv "#a1a1a1",
		metalgray7 = hsluv "#c1c1c1",
	}, bg)
end

local generator = require "zenbones.specs"
local base_specs = generator.generate(palette, bg, generator.get_global_config(colors_name, bg))

local specs = lush.extends({ base_specs }).with(function()
	return {
		Normal { base_specs.Normal, fg = palette.metalgray5 },
		Number { base_specs.Number, fg = palette.khold },
		Float { base_specs.Float, fg = palette.khold },
		Constant { base_specs.Constant, fg = palette.metalgreen },
		Statement { base_specs.Statement, fg = palette.metalgray6 },
		Type { base_specs.Type, fg = palette.metalgray3 },
		Function { base_specs.Function, fg = palette.metalgray4 },
		GitSignsAdd { base_specs.GitSignsAdd, fg = palette.metalgreen },
		GitSignsDelete { base_specs.GitSignsDelete, fg = palette.metalred },
		GitSignsChange { base_specs.GitSignsDelete, fg = palette.metalblue },
	}
end)

lush(specs)
