-- Static lualine theme for batbones dark
local common_fg = "#7C878E" -- bat_slate
local inactive_bg = "#1D2434" -- bat_shadow
local inactive_fg = "#7C878E"

return {
	normal = {
		a = { bg = "#44496F", fg = common_fg, gui = "bold" }, -- bat_purple
		b = { bg = "#2A3042", fg = common_fg },
		c = { bg = "#1D2434", fg = "#7C878E" },              -- bat_shadow
	},

	insert = {
		a = { bg = "#003DA5", fg = "#B8C0C6", gui = "bold" }, -- bat_blue
	},

	command = {
		a = { bg = "#C22A2A", fg = common_fg, gui = "bold" }, -- bat_crimson
	},

	visual = {
		a = { bg = "#F1BE48", fg = "#080808", gui = "bold" }, -- bat_gold on bat_black
	},

	replace = {
		a = { bg = "#EFbe7D", fg = "#080808", gui = "bold" }, -- bat_amber on bat_black
	},

	inactive = {
		a = { bg = inactive_bg, fg = inactive_fg, gui = "bold" },
		b = { bg = inactive_bg, fg = inactive_fg },
		c = { bg = inactive_bg, fg = inactive_fg },
	},
}
