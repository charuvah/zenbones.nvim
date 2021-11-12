-- This file is auto-generated by shipwright.nvim
local common_fg = "#4B4B4B"
local inactive_bg = "#C9C9C9"
local inactive_fg = "#818181"

return {
	normal = {
		a = { bg = "#9E9E9E", fg = common_fg, gui = "bold" },
		b = { bg = "#B0B0B0", fg = common_fg },
		c = { bg = "#BEBEBE", fg = "#555555" },
	},

	insert = {
		a = { bg = "#99B5C3", fg = common_fg, gui = "bold" },
	},

	command = {
		a = { bg = "#CBB1CA", fg = common_fg, gui = "bold" },
	},

	visual = {
		a = { bg = "#CCCCCC", fg = common_fg, gui = "bold" },
	},

	replace = {
		a = { bg = "#E5CBD1", fg = common_fg, gui = "bold" },
	},

	inactive = {
		a = { bg = inactive_bg, fg = inactive_fg, gui = "bold" },
		b = { bg = inactive_bg, fg = inactive_fg },
		c = { bg = inactive_bg, fg = inactive_fg },
	},
}