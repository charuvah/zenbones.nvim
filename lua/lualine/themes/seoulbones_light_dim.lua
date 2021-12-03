-- This file is auto-generated by shipwright.nvim
local common_fg = "#494949"
local inactive_bg = "#CCCCCC"
local inactive_fg = "#818181"

return {
	normal = {
		a = { bg = "#A0A0A0", fg = common_fg, gui = "bold" },
		b = { bg = "#B3B3B3", fg = common_fg },
		c = { bg = "#C6C6C6", fg = "#555555" },
	},

	insert = {
		a = { bg = "#91ADBA", fg = common_fg, gui = "bold" },
	},

	command = {
		a = { bg = "#C5A7C4", fg = common_fg, gui = "bold" },
	},

	visual = {
		a = { bg = "#C4C4C4", fg = common_fg, gui = "bold" },
	},

	replace = {
		a = { bg = "#E1C1C9", fg = common_fg, gui = "bold" },
	},

	inactive = {
		a = { bg = inactive_bg, fg = inactive_fg, gui = "bold" },
		b = { bg = inactive_bg, fg = inactive_fg },
		c = { bg = inactive_bg, fg = inactive_fg },
	},
}