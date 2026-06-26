-- Static lualine theme for carbones dark
local common_fg = "#9a9da3"
local inactive_bg = "#232323"
local inactive_fg = "#474A51"

return {
	normal = {
		a = { bg = "#474A51", fg = common_fg, gui = "bold" },
		b = { bg = "#2E2E2E", fg = common_fg },
		c = { bg = "#262626", fg = "#474A51" },
	},

	insert = {
		a = { bg = "#252626", fg = common_fg, gui = "bold" },
	},

	command = {
		a = { bg = "#282625", fg = common_fg, gui = "bold" },
	},

	visual = {
		a = { bg = "#4B4E53", fg = "#232323", gui = "bold" },
	},

	replace = {
		a = { bg = "#2E2E2E", fg = common_fg, gui = "bold" },
	},

	inactive = {
		a = { bg = inactive_bg, fg = inactive_fg, gui = "bold" },
		b = { bg = inactive_bg, fg = inactive_fg },
		c = { bg = inactive_bg, fg = inactive_fg },
	},
}
