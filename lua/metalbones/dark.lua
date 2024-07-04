local util = require "zenbones.util"
local color = require "metalbones.palette"
local lush = require "lush"
local hsluv = lush.hsluv

local M = {}

local fbg = { bg = hsluv "#0a0a0a", fg = hsluv "#999999" }
for k, v in pairs(color) do
	fbg[k] = v
end

M.palette = {}
M.palette = util.palette_extend(fbg, "dark")

---@class theme.ui
M.ui = {
	normal = color.metal_gray5,
	non_text = color.metal_gray3.darken(20),
	line_nr = color.metal_gray3.darken(30),
	more_msg = color.metal_steel.mix(color.metal_gray2, 20),
	warning_msg = color.metal_barthory.mix(color.metal_gray2, 50),
	invisibles = color.metal_gray1.lighten(50),
}

M.ui.cursor = {
	bg = color.metal_silver,
	fg = color.metal_gray1,
	highlight = color.metal_gray1.lighten(2),
}

M.ui.visual = { bg = color.metal_gray2.darken(30) }

M.ui.search = {
	bg = color.metal_stone.mix(color.metal_gray2, 50).darken(10),
	fg = color.metal_gray1,
}

M.ui.search_inc = {
	bg = color.metal_barthory.mix(color.metal_gray2, 50).darken(10),
	fg = color.metal_gray1,
}

M.ui.tab = {}
M.ui.tab.line = {
	bg = color.metal_gray0,
	fg = color.metal_gray3,
}
M.ui.tab.sel = {
	bg = color.metal_gray1,
	fg = color.metal_thorn,
}

---@class theme.syntax
M.syntax = {
	number = color.metal_rust,
	float = color.metal_rust.lighten(10),
	constant = color.metal_steel.mix(color.metal_gray2, 25),
	type = color.metal_gray4,
	func = color.metal_gray4.darken(50),
	keyword = color.metal_gray3.lighten(10),
	variable = color.metal_gray5.darken(20),
	member = color.metal_gray5.darken(40),
	property = color.metal_gray5.darken(40),
	typedef = color.metal_gray4.lighten(10),
	parameter = color.metal_gray4.darken(20),
}

M.syntax.string = {
	escape = color.metal_steel.darken(50),
	special = color.metal_steel.darken(50),
	regexp = color.metal_electric,
}

M.syntax.punctuation = {
	operator = color.metal_gray3.lighten(10),
	bracket = color.metal_gray3.lighten(10),
	special = color.metal_gray3.lighten(10),
	delimiter = color.metal_gray3.lighten(10),
	constructor = color.metal_gray3.lighten(10),
}

M.syntax.comment = {
	fg = color.metal_gray2.lighten(8),
	todo = color.metal_barthelo.mix(color.metal_gray2, 70),
	warn = color.metal_barthelo.mix(color.metal_gray2, 70),
	error = color.metal_barthory.mix(color.metal_gray2, 70),
	note = color.metal_electric.mix(color.metal_gray2, 50),
	question = color.metal_electric.mix(color.metal_gray2, 50),
	special = color.metal_barthory.mix(color.metal_gray2, 70),
}
M.syntax.wild_menu = { bg = color.metal_rose.darken(50) }

---@class theme.vcs
M.vcs = {}
M.vcs.diff_add = {
	bg = color.metal_nile.mix(color.metal_black, 85),
	fg = color.metal_nile.mix(color.metal_gray2, 30),
}
M.vcs.diff_delete = {
	bg = color.metal_thorn.mix(color.metal_black, 85),
	fg = color.metal_thorn.mix(color.metal_gray2, 30),
}
M.vcs.diff_change = {
	bg = color.metal_electric.mix(color.metal_black, 85),
	fg = color.metal_electric.mix(color.metal_gray2, 30),
}
M.vcs.diff_text = {
	bg = color.metal_gray4.mix(color.metal_black, 90),
	fg = color.metal_gray4.mix(color.metal_gray2, 30),
}

M.vcs.sign = {
	add = color.metal_gray2,
	delete = color.metal_thorn.darken(50),
	change = color.metal_electric.darken(50),
}

---@class theme.diagnostics
M.diagnostics = {
	ok = color.metal_nile.mix(color.metal_gray2, 30),
	hint = color.metal_gray3.darken(20),
	info = color.metal_electric.mix(color.metal_gray2, 30),
	warn = color.metal_barthory.mix(color.metal_gray2, 70),
	error = color.metal_rust.mix(color.metal_gray2, 60),
}
M.diagnostics.virtual = {}
M.diagnostics.virtual.ok = {
	bg = color.metal_nile.mix(color.metal_black, 85),
	fg = color.metal_nile.mix(color.metal_gray2, 30),
}
M.diagnostics.virtual.hint = {
	bg = color.metal_gray3.mix(color.metal_black, 80),
	fg = color.metal_gray3.darken(20),
}
M.diagnostics.virtual.info = {
	bg = color.metal_electric.mix(color.metal_black, 85),
	fg = color.metal_electric.mix(color.metal_gray2, 30),
}
M.diagnostics.virtual.warn = {
	bg = color.metal_barthory.mix(color.metal_black, 95),
	fg = color.metal_barthory.mix(color.metal_gray2, 70),
}
M.diagnostics.virtual.error = {
	bg = color.metal_rust.mix(color.metal_black, 90),
	fg = color.metal_rust.mix(color.metal_gray2, 60),
}

local c = color.metal_rust.mix(color.metal_black, 90)

---@class theme.plugins
M.plugins = {}
M.plugins.float = {
	bg = color.metal_gray1,
	fg = color.metal_gray5,
}
M.plugins.telescope = {
	matching = color.metal_rose.darken(10),
}

M.plugins.flash = {
	label = color.metal_electric,
}

---@class theme.lang
M.lang = {}
M.lang.xml = {
	tag = color.metal_gray3,
	tag_name = color.metal_gray3.lighten(10),
	attrib = color.metal_gray3.lighten(30),
}

return M
