local generator = require "zenbones.specs"
local bg = vim.o.background
local lush = require "lush"
local palette = require("metalbones.palette")[bg]

local base_specs = generator.generate(palette, bg, generator.get_global_config("metalbones", bg))

local specs = lush.extends({ base_specs }).with(function()
	return {
		Normal { base_specs.Normal, fg = palette.metalgray5 },
		Number { base_specs.Number, fg = palette.khold },
		Float { base_specs.Float, fg = palette.khold },
		Constant { base_specs.Constant, fg = palette.metalgreen },
		String { base_specs.Constant, fg = palette.metalgreen },
		Statement { base_specs.Statement, fg = palette.metalgray6 },
		Type { base_specs.Type, fg = palette.metalgray3 },
		Function { base_specs.Function, fg = palette.metalgray4 },
		Search { base_specs.Search, bg = palette.metalyellow },
		IncSearch { base_specs.IncSearch, bg = palette.bathory, fg = palette.metalgray2 },
		GitSignsAdd { base_specs.GitSignsAdd, fg = palette.metalgreen },
		GitSignsDelete { base_specs.GitSignsDelete, fg = palette.metalred },
		GitSignsChange { base_specs.GitSignsDelete, fg = palette.metalblue },
	}
end)

return specs
