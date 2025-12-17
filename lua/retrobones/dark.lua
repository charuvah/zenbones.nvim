local util = require "zenbones.util"
local color = require "retrobones.palette"
local lush = require "lush"
local hsluv = lush.hsluv

local M = {}

local fbg = { bg = hsluv "#000000", fg = hsluv "#999999" }
for k, v in pairs(color) do
	fbg[k] = v
end

M.palette = {}
M.palette = util.palette_extend(fbg, "dark")

---@class theme.ui
M.ui = {
	normal = color.retro_dark4.lighten(50),
	non_text = color.retro_dark4.lighten(50).darken(40),
	line_nr = color.retro_bright2.darken(80).mix(color.retro_bright4.darken(70), 60).de(50),
	more_msg = color.retro_dark4.lighten(50).mix(color.retro_dark3, 20),
	warning_msg = color.retro_dark4.lighten(50).mix(color.retro_dark3, 50),
	invisibles = color.retro_dark3.lighten(50),
}

M.ui.cursor = {
	bg = color.retro_bright4,
	fg = color.retro_dark1,
	highlight = color.retro_bright4.darken(80),
}

M.ui.visual = { bg = color.retro_bright4.darken(80) }

M.ui.search = {
	-- bg = color.retro_bright4.mix(color.retro_dark1, 50).darken(50),
	bg = color.retro_dark2,
	fg = color.retro_mid3,
}

M.ui.search_inc = {
	bg = color.retro_bright4.mix(color.retro_mid4, 50),
	fg = color.retro_dark3,
}

M.ui.tab = {}
M.ui.tab.line = {
	bg = color.retro_dark2,
	fg = color.retro_dark4.lighten(50).darken(20),
}
M.ui.tab.sel = {
	bg = color.retro_dark3,
	fg = color.retro_dark4.lighten(50),
}

---@class theme.syntax
M.syntax = {
	number = color.retro_bright3.darken(10),
	float = color.retro_bright3,
	constant = color.retro_bright2.mix(color.retro_mid1, 30).darken(10),
	type = color.retro_dark4.lighten(50),
	func = color.retro_dark4.lighten(50).darken(50),
	keyword = color.retro_dark4.lighten(50).darken(10),
	variable = color.retro_dark4.lighten(50).darken(20),
	member = color.retro_dark4.lighten(50).darken(40),
	property = color.retro_dark4.lighten(50).darken(40),
	typedef = color.retro_dark4.lighten(50).lighten(10),
	parameter = color.retro_dark4.lighten(50).darken(20),
	color_column = color.retro_dark4.lighten(50).darken(20),
}

M.syntax.string = {
	escape = color.retro_dark4,
	special = color.retro_mid4.mix(color.retro_bright3, 40).darken(10),
	regexp = color.retro_dark4.lighten(50),
}

M.syntax.punctuation = {
	operator = color.retro_mid3,
	bracket = color.retro_mid3,
	special = color.retro_mid4,
	delimiter = color.retro_mid3,
	constructor = color.retro_mid3,
}

M.syntax.comment = {
	fg = color.retro_dark3.lighten(8),
	todo = color.retro_dark4.lighten(50).mix(color.retro_dark3, 70),
	warn = color.retro_dark4.lighten(50).mix(color.retro_dark3, 70),
	error = color.retro_dark4.lighten(50).mix(color.retro_dark3, 70),
	note = color.retro_dark4.lighten(50).mix(color.retro_dark3, 50),
	question = color.retro_dark4.lighten(50).mix(color.retro_dark3, 50),
	special = color.retro_dark4.lighten(50).mix(color.retro_dark3, 70),
}
M.syntax.wild_menu = { bg = color.retro_dark4.lighten(50).darken(50) }

---@class theme.vcs
M.vcs = {}
M.vcs.diff_add = {
	bg = color.retro_dark4.lighten(50).mix(color.retro_dark4.lighten(50), 85),
	fg = color.retro_dark4.lighten(50).mix(color.retro_dark3, 30),
}
M.vcs.diff_delete = {
	bg = color.retro_dark4.lighten(50).mix(color.retro_dark4.lighten(50), 85),
	fg = color.retro_dark4.lighten(50).mix(color.retro_dark3, 30),
}
M.vcs.diff_change = {
	bg = color.retro_dark4.lighten(50).mix(color.retro_dark4.lighten(50), 85),
	fg = color.retro_dark4.lighten(50).mix(color.retro_dark3, 30),
}
M.vcs.diff_text = {
	bg = color.retro_dark4.lighten(50).mix(color.retro_dark4.lighten(50), 90),
	fg = color.retro_dark4.lighten(50).mix(color.retro_dark3, 30),
}

M.vcs.sign = {
	add = color.retro_dark3,
	delete = color.retro_dark4.lighten(50).darken(50),
	change = color.retro_dark4.lighten(50).darken(50),
}

---@class theme.diagnostics
M.diagnostics = {
	ok = color.retro_dark4.lighten(50).mix(color.retro_dark3, 30),
	hint = color.retro_dark4.lighten(50).darken(40),
	info = color.retro_dark4.lighten(50).mix(color.retro_dark3, 30),
	warn = color.retro_dark4.lighten(50).mix(color.retro_dark3, 70),
	error = color.retro_dark4.lighten(50).mix(color.retro_dark3, 60),
}
M.diagnostics.virtual = {}
M.diagnostics.virtual.ok = {
	bg = color.retro_dark4.lighten(50).mix(color.retro_dark4.lighten(50), 85),
	fg = color.retro_dark4.lighten(50).mix(color.retro_dark3, 30),
}
M.diagnostics.virtual.hint = {
	bg = color.retro_dark4.lighten(50).darken(20).mix(color.retro_dark4.lighten(50), 80),
	fg = color.retro_dark4.lighten(50).darken(40),
}
M.diagnostics.virtual.info = {
	bg = color.retro_dark4.lighten(50).mix(color.retro_dark4.lighten(50), 85),
	fg = color.retro_dark4.lighten(50).mix(color.retro_dark3, 30),
}
M.diagnostics.virtual.warn = {
	bg = color.retro_dark4.lighten(50).mix(color.retro_dark4.lighten(50), 95),
	fg = color.retro_dark4.lighten(50).mix(color.retro_dark3, 70),
}
M.diagnostics.virtual.error = {
	bg = color.retro_dark4.lighten(50).mix(color.retro_dark4.lighten(50), 90),
	fg = color.retro_dark4.lighten(50).mix(color.retro_dark3, 60),
}

local c = color.retro_dark4.lighten(50).mix(color.retro_dark4.lighten(50), 90)

---@class theme.plugins
M.plugins = {}
M.plugins.float = {
	bg = color.retro_dark3,
	fg = color.retro_dark4.lighten(50),
}
M.plugins.telescope = {
	matching = color.retro_dark4.lighten(50).darken(10),
}

M.plugins.flash = {
	label = color.retro_dark4.lighten(50),
}

---@class theme.lang
M.lang = {}
M.lang.xml = {
	tag = color.retro_dark4.lighten(50).darken(20),
	tag_name = color.retro_dark4.lighten(50).darken(10),
	attrib = color.retro_dark4.lighten(50).lighten(10),
}

return M
