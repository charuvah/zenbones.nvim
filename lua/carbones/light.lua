local util = require "zenbones.util"
local color = require "carbones.palette"
local lush = require "lush"
local hsluv = lush.hsluv

local M = {}

local fbg = { bg = hsluv "#ebebec", fg = hsluv "#2e2e2e" }
for k, v in pairs(color) do
	fbg[k] = v
end

M.palette = {}
M.palette = util.palette_extend(fbg, "light")

---@class theme.ui
M.ui = {
	normal      = color.carb_cool,
	non_text    = color.carb_glint.lighten(50),
	line_nr     = color.carb_glint.lighten(55),
	more_msg    = color.carb_graphite,
	warning_msg = color.carb_warm.lighten(8),
	faded       = color.carb_glint.lighten(40),
	invisibles  = color.carb_glint.lighten(60),
}

M.ui.cursor = {
	bg        = color.carb_cool,
	fg        = color.carb_glint.lighten(60),
	highlight = color.carb_glint.lighten(65),
	line_nr   = color.carb_cool,
}

M.ui.visual = { bg = color.carb_glint.lighten(58) }

M.ui.search = {
	bg = color.carb_glint.lighten(52),
	fg = color.carb_raw,
}

M.ui.search_inc = {
	bg = color.carb_graphite.lighten(45),
	fg = color.carb_raw,
}

M.ui.tab = {}
M.ui.tab.line = {
	bg = color.carb_glint.lighten(62),
	fg = color.carb_graphite,
}
M.ui.tab.sel = {
	bg = color.carb_white,
	fg = color.carb_cool,
}

M.ui.pmenu = {
	sel  = color.carb_glint.lighten(60),
	sbar = color.carb_glint.lighten(65),
}

---@class theme.syntax
M.syntax = {
	number    = color.carb_deep.lighten(5).sa(10),
	float     = color.carb_deep.lighten(3).sa(10),
	constant  = color.carb_warm,
	special   = color.carb_graphite.lighten(8),
	type      = color.carb_cool.lighten(5),
	func      = color.carb_graphite,
	keyword   = color.carb_raw,
	variable  = color.carb_cool.lighten(8),
	member    = color.carb_graphite.lighten(5),
	property  = color.carb_graphite.lighten(5),
	typedef   = color.carb_cool.lighten(3),
	parameter = color.carb_graphite.lighten(3),
}

M.syntax.string = {
	escape  = color.carb_warm.darken(5),
	special = color.carb_warm.lighten(2),
	regexp  = color.carb_deep.sa(10),
}

M.syntax.punctuation = {
	operator    = color.carb_graphite.lighten(15),
	bracket     = color.carb_graphite.lighten(18),
	special     = color.carb_graphite.lighten(16),
	delimiter   = color.carb_graphite.lighten(18),
	constructor = color.carb_graphite.lighten(18),
}

M.syntax.comment = {
	fg       = color.carb_glint.lighten(45),
	todo     = color.carb_graphite.lighten(30),
	warn     = color.carb_warm.lighten(12),
	error    = color.carb_graphite.lighten(20),
	note     = color.carb_deep.lighten(5).sa(8),
	question = color.carb_deep.lighten(5).sa(8),
	special  = color.carb_graphite.lighten(25),
}

M.syntax.wild_menu = { bg = color.carb_glint.lighten(55) }

---@class theme.vcs
M.vcs = {}
M.vcs.diff_add = {
	bg = color.carb_warm.mix(color.carb_white, 85),
	fg = color.carb_warm.darken(5),
}
M.vcs.diff_delete = {
	bg = color.carb_graphite.mix(color.carb_white, 85),
	fg = color.carb_raw,
}
M.vcs.diff_change = {
	bg = color.carb_deep.mix(color.carb_white, 85).sa(5),
	fg = color.carb_deep.sa(8),
}
M.vcs.diff_text = {
	bg = color.carb_cool.mix(color.carb_white, 85),
	fg = color.carb_cool.darken(5),
}

M.vcs.sign = {
	add    = color.carb_warm.lighten(5),
	delete = color.carb_graphite,
	change = color.carb_deep.sa(8),
}

---@class theme.diagnostics
M.diagnostics = {
	ok    = color.carb_graphite.lighten(12),
	hint  = color.carb_graphite.lighten(18),
	info  = color.carb_deep.sa(8),
	warn  = color.carb_warm,
	error = color.carb_raw,
}
M.diagnostics.virtual = {}
M.diagnostics.virtual.ok = {
	bg = color.carb_glint.mix(color.carb_white, 85),
	fg = color.carb_graphite.lighten(12),
}
M.diagnostics.virtual.hint = {
	bg = color.carb_glint.mix(color.carb_white, 88),
	fg = color.carb_graphite.lighten(18),
}
M.diagnostics.virtual.info = {
	bg = color.carb_deep.mix(color.carb_white, 90).sa(3),
	fg = color.carb_deep.sa(8),
}
M.diagnostics.virtual.warn = {
	bg = color.carb_warm.mix(color.carb_white, 90),
	fg = color.carb_warm,
}
M.diagnostics.virtual.error = {
	bg = color.carb_graphite.mix(color.carb_white, 88),
	fg = color.carb_raw,
}

---@class theme.plugins
M.plugins = {}
M.plugins.float = {
	bg = color.carb_glint.lighten(65),
	fg = color.carb_cool,
}
M.plugins.telescope = {
	matching = color.carb_raw,
}
M.plugins.flash = {
	label = color.carb_cool,
}

---@class theme.lang
M.lang = {}
M.lang.xml = {
	tag      = color.carb_graphite.lighten(18),
	tag_name = color.carb_graphite.lighten(12),
	attrib   = color.carb_graphite.lighten(20),
}

return M
