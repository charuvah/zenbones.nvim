local util = require "zenbones.util"
local color = require "batbones.palette"
local lush = require "lush"
local hsluv = lush.hsluv

local M = {}

local fbg = { bg = hsluv "#dde2e7", fg = hsluv "#2a3042" }
for k, v in pairs(color) do
	fbg[k] = v
end

M.palette = {}
M.palette = util.palette_extend(fbg, "light")

-- Muted accent tones for light background — mixed toward white/fog
local gold    = color.bat_gold.de(60).darken(35)     -- olive-tan
local blue    = color.bat_blue.lighten(10).de(45)    -- muted navy
local amber   = color.bat_amber.de(60).darken(25)    -- warm sand
local crimson = color.bat_crimson.lighten(5).de(45)  -- dusty red

---@class theme.ui
M.ui = {
	normal      = color.bat_shadow,
	non_text    = color.bat_fog.darken(30),
	line_nr     = color.bat_fog.darken(15),
	more_msg    = color.bat_slate,
	warning_msg = amber,
	faded       = color.bat_slate.lighten(20),
	invisibles  = color.bat_fog.darken(5),
}

M.ui.cursor = {
	bg        = color.bat_shadow,
	fg        = color.bat_fog,
	highlight = color.bat_fog.lighten(60),
	line_nr   = color.bat_shadow,
}

M.ui.visual = { bg = color.bat_fog.darken(5) }

M.ui.search = {
	bg = color.bat_fog.darken(10),
	fg = color.bat_shadow,
}

M.ui.search_inc = {
	bg = color.bat_purple.mix(color.bat_white, 60),
	fg = color.bat_shadow,
}

M.ui.tab = {}
M.ui.tab.line = {
	bg = color.bat_fog,
	fg = color.bat_slate,
}
M.ui.tab.sel = {
	bg = color.bat_white,
	fg = color.bat_shadow,
}

M.ui.pmenu = {
	sel  = color.bat_fog,
	sbar = color.bat_fog.lighten(50),
}

---@class theme.syntax
M.syntax = {
	-- accents: one role each
	number    = crimson,
	float     = crimson.darken(5),
	constant  = amber,    -- String/Character inherit from this
	func      = gold,
	method    = color.bat_shadow.lighten(25),
	keyword   = blue,
	-- neutral from here down
	special   = color.bat_slate,
	type      = color.bat_shadow.lighten(10),
	variable  = color.bat_shadow.lighten(20),
	member    = color.bat_slate,
	property  = color.bat_slate,
	typedef   = color.bat_shadow.lighten(5),
	parameter = color.bat_slate.darken(10),
}

M.syntax.string = {
	escape  = amber.darken(15),
	special = amber.darken(10),
	regexp  = blue.darken(10),
}

M.syntax.punctuation = {
	operator    = color.bat_purple,
	bracket     = color.bat_purple,
	special     = color.bat_purple,
	delimiter   = color.bat_purple,
	constructor = color.bat_purple,
}

M.syntax.comment = {
	fg       = color.bat_fog.darken(20),
	todo     = gold.mix(color.bat_fog, 50),
	warn     = amber.mix(color.bat_fog, 50),
	error    = crimson.mix(color.bat_fog, 50),
	note     = blue.mix(color.bat_fog, 50),
	question = blue.mix(color.bat_fog, 50),
	special  = color.bat_purple.mix(color.bat_fog, 50),
}

M.syntax.wild_menu = { bg = color.bat_fog.darken(15) }

---@class theme.vcs
M.vcs = {}
M.vcs.diff_add = {
	bg = gold.mix(color.bat_white, 85),
	fg = gold.mix(color.bat_shadow, 30),
}
M.vcs.diff_delete = {
	bg = crimson.mix(color.bat_white, 85),
	fg = crimson.mix(color.bat_shadow, 30),
}
M.vcs.diff_change = {
	bg = blue.mix(color.bat_white, 85),
	fg = blue.mix(color.bat_shadow, 30),
}
M.vcs.diff_text = {
	bg = color.bat_purple.mix(color.bat_white, 85),
	fg = color.bat_purple.mix(color.bat_shadow, 30),
}

M.vcs.sign = {
	add    = gold.mix(color.bat_shadow, 30),
	delete = crimson,
	change = blue,
}

---@class theme.diagnostics
M.diagnostics = {
	ok    = color.bat_slate,
	hint  = color.bat_slate.lighten(10),
	info  = blue,
	warn  = amber,
	error = crimson,
}
M.diagnostics.virtual = {}
M.diagnostics.virtual.ok = {
	bg = color.bat_fog.lighten(30),
	fg = color.bat_slate,
}
M.diagnostics.virtual.hint = {
	bg = color.bat_fog.lighten(30),
	fg = color.bat_slate.lighten(10),
}
M.diagnostics.virtual.info = {
	bg = blue.mix(color.bat_white, 90),
	fg = blue,
}
M.diagnostics.virtual.warn = {
	bg = amber.mix(color.bat_white, 90),
	fg = amber,
}
M.diagnostics.virtual.error = {
	bg = crimson.mix(color.bat_white, 90),
	fg = crimson,
}

---@class theme.plugins
M.plugins = {}
M.plugins.float = {
	bg = color.bat_fog.lighten(40),
	fg = color.bat_shadow,
}
M.plugins.telescope = {
	matching = blue,
}
M.plugins.flash = {
	label = color.bat_shadow,
}

---@class theme.lang
M.lang = {}
M.lang.xml = {
	tag      = color.bat_purple,
	tag_name = color.bat_purple.lighten(10),
	attrib   = color.bat_slate,
}

return M
