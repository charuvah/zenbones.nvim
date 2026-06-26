local util = require "zenbones.util"
local color = require "carbones.palette"
local lush = require "lush"
local hsluv = lush.hsluv

local M = {}

local fbg = { bg = hsluv "#262626", fg = hsluv "#9a9da3" }
for k, v in pairs(color) do
	fbg[k] = v
end

M.palette = {}
M.palette = util.palette_extend(fbg, "dark")

-- Accent strands are all very dark (~L12-17%). For fg use they are lightened
-- ~28-32 steps — enough to read but still muted. As bg tints they work as-is.

---@class theme.ui
M.ui = {
	normal      = color.carb_graphite.lighten(27),
	non_text    = color.carb_standard.lighten(18),
	line_nr     = color.carb_standard.lighten(12),
	more_msg    = color.carb_graphite.lighten(20),
	warning_msg = color.carb_gold.lighten(30),
	faded       = color.carb_graphite.lighten(10),
	invisibles  = color.carb_standard.lighten(20),
}

M.ui.cursor = {
	bg        = color.carb_glint.lighten(55),
	fg        = color.carb_raw,
	highlight = color.carb_cool,
	line_nr   = color.carb_graphite.lighten(15),
}

M.ui.visual = { bg = color.carb_plum.lighten(8) }

M.ui.search = {
	bg = color.carb_titanium.lighten(8),
	fg = color.carb_graphite.lighten(40),
}

M.ui.search_inc = {
	bg = color.carb_gold.lighten(10),
	fg = color.carb_glint.lighten(50),
}

M.ui.tab = {}
M.ui.tab.line = {
	bg = color.carb_raw,
	fg = color.carb_standard.lighten(22),
}
M.ui.tab.sel = {
	bg = color.carb_cool,
	fg = color.carb_graphite.lighten(35),
}

M.ui.pmenu = {
	sel  = color.carb_cool.lighten(8),
	sbar = color.carb_cool,
}

---@class theme.syntax
M.syntax = {
	number    = color.carb_oxblood.de(25).lighten(28),
	float     = color.carb_oxblood.de(25).lighten(30),
	constant  = color.carb_gold.de(40).lighten(28),
	special   = color.carb_teal.de(50).lighten(27),
	type      = color.carb_plum.de(50).lighten(28),
	func      = color.carb_glint.lighten(27),
	keyword   = color.carb_titanium.de(55).lighten(30),
	variable  = color.carb_graphite.lighten(22),
	member    = color.carb_graphite.lighten(14),
	property  = color.carb_graphite.lighten(14),
	typedef   = color.carb_plum.de(50).lighten(22),
	parameter = color.carb_graphite.lighten(16),
}

M.syntax.string = {
	escape  = color.carb_bronze.de(45).lighten(25),
	special = color.carb_bronze.de(45).lighten(27),
	regexp  = color.carb_teal.de(50).lighten(25),
}

M.syntax.punctuation = {
	operator    = color.carb_graphite.lighten(12),
	bracket     = color.carb_graphite.lighten(10),
	special     = color.carb_graphite.lighten(11),
	delimiter   = color.carb_graphite.lighten(10),
	constructor = color.carb_graphite.lighten(10),
}

M.syntax.comment = {
	fg       = color.carb_standard.lighten(17),
	todo     = color.carb_gold.de(55).lighten(20),
	warn     = color.carb_oxblood.de(45).lighten(20),
	error    = color.carb_oxblood.de(45).lighten(15),
	note     = color.carb_teal.de(50).lighten(18),
	question = color.carb_teal.de(50).lighten(18),
	special  = color.carb_plum.de(50).lighten(18),
}

M.syntax.wild_menu = { bg = color.carb_plum }

---@class theme.vcs
M.vcs = {}
M.vcs.diff_add = {
	bg = color.carb_teal,
	fg = color.carb_teal.lighten(28),
}
M.vcs.diff_delete = {
	bg = color.carb_oxblood,
	fg = color.carb_oxblood.lighten(25),
}
M.vcs.diff_change = {
	bg = color.carb_titanium,
	fg = color.carb_titanium.lighten(28),
}
M.vcs.diff_text = {
	bg = color.carb_plum,
	fg = color.carb_plum.lighten(25),
}

M.vcs.sign = {
	add    = color.carb_teal.lighten(25),
	delete = color.carb_oxblood.lighten(23),
	change = color.carb_titanium.lighten(28),
}

---@class theme.diagnostics
M.diagnostics = {
	ok    = color.carb_teal.lighten(28),
	hint  = color.carb_graphite.lighten(12),
	info  = color.carb_titanium.lighten(30),
	warn  = color.carb_gold.lighten(28),
	error = color.carb_oxblood.lighten(25),
}
M.diagnostics.virtual = {}
M.diagnostics.virtual.ok = {
	bg = color.carb_teal.mix(color.carb_black, 60),
	fg = color.carb_teal.lighten(28),
}
M.diagnostics.virtual.hint = {
	bg = color.carb_cool.mix(color.carb_black, 70),
	fg = color.carb_graphite.lighten(12),
}
M.diagnostics.virtual.info = {
	bg = color.carb_titanium.mix(color.carb_black, 60),
	fg = color.carb_titanium.lighten(30),
}
M.diagnostics.virtual.warn = {
	bg = color.carb_gold.mix(color.carb_black, 60),
	fg = color.carb_gold.lighten(28),
}
M.diagnostics.virtual.error = {
	bg = color.carb_oxblood.mix(color.carb_black, 60),
	fg = color.carb_oxblood.lighten(25),
}

---@class theme.plugins
M.plugins = {}
M.plugins.float = {
	bg = color.carb_raw,
	fg = color.carb_graphite.lighten(25),
}
M.plugins.telescope = {
	matching = color.carb_gold.lighten(35),
}
M.plugins.flash = {
	label = color.carb_glint.lighten(55),
}

---@class theme.lang
M.lang = {}
M.lang.xml = {
	tag      = color.carb_teal.lighten(20),
	tag_name = color.carb_teal.lighten(26),
	attrib   = color.carb_graphite.lighten(14),
}

return M
