local util = require "zenbones.util"
local color = require "batbones.palette"
local lush = require "lush"
local hsluv = lush.hsluv

local M = {}

local fbg = { bg = hsluv "#080808", fg = hsluv "#7c878e" }
for k, v in pairs(color) do
	fbg[k] = v
end

M.palette = {}
M.palette = util.palette_extend(fbg, "dark")

-- Muted accent tones used throughout — vivid source colors pulled way back
local gold    = color.bat_gold.de(60).darken(25)    -- warm khaki
local blue    = color.bat_blue.lighten(30).de(50)   -- slate blue
local amber   = color.bat_amber.de(60).darken(15)   -- warm tan
local crimson = color.bat_crimson.lighten(15).de(50) -- dusty rose

---@class theme.ui
M.ui = {
	normal      = color.bat_slate,
	non_text    = color.bat_shadow.lighten(20),
	line_nr     = color.bat_shadow.lighten(8),
	more_msg    = color.bat_slate.lighten(10),
	warning_msg = amber,
	faded       = color.bat_slate.darken(30),
	invisibles  = color.bat_shadow.lighten(30),
}

M.ui.cursor = {
	bg        = color.bat_gold,   -- cursor needs full visibility
	fg        = color.bat_black,
	highlight = color.bat_shadow,
	line_nr   = color.bat_slate,
}

M.ui.visual = { bg = color.bat_purple.darken(25) }

M.ui.search = {
	bg = color.bat_shadow.lighten(15),
	fg = color.bat_slate.lighten(20),
}

M.ui.search_inc = {
	bg = color.bat_purple.lighten(10),
	fg = color.bat_fog,
}

M.ui.tab = {}
M.ui.tab.line = {
	bg = color.bat_black,
	fg = color.bat_shadow.lighten(30),
}
M.ui.tab.sel = {
	bg = color.bat_shadow,
	fg = color.bat_slate.lighten(20),
}

M.ui.pmenu = {
	sel  = color.bat_purple,
	sbar = color.bat_shadow,
}

---@class theme.syntax
M.syntax = {
	-- accents: one role each
	number    = crimson,
	float     = crimson.lighten(5),
	constant  = amber,    -- String/Character inherit from this
	func      = gold,
	keyword   = blue,
	-- neutral from here down
	special   = color.bat_slate,
	type      = color.bat_slate.lighten(10),
	variable  = color.bat_slate.darken(10),
	member    = color.bat_slate.darken(30),
	property  = color.bat_slate.darken(30),
	typedef   = color.bat_slate.lighten(20),
	parameter = color.bat_slate.darken(20),
}

M.syntax.string = {
	escape  = amber.darken(20),
	special = amber.darken(10),
	regexp  = blue.darken(10),
}

M.syntax.punctuation = {
	operator    = color.bat_purple.lighten(25),
	bracket     = color.bat_purple.lighten(15),
	special     = color.bat_purple.lighten(20),
	delimiter   = color.bat_purple.lighten(15),
	constructor = color.bat_purple.lighten(15),
}

M.syntax.comment = {
	fg       = color.bat_shadow.lighten(15),
	todo     = gold.mix(color.bat_shadow, 60),
	warn     = amber.mix(color.bat_shadow, 60),
	error    = crimson.mix(color.bat_shadow, 60),
	note     = blue.mix(color.bat_shadow, 60),
	question = blue.mix(color.bat_shadow, 60),
	special  = color.bat_purple.lighten(10).mix(color.bat_shadow, 60),
}

M.syntax.wild_menu = { bg = color.bat_purple.darken(30) }

---@class theme.vcs
M.vcs = {}
M.vcs.diff_add = {
	bg = gold.mix(color.bat_black, 90),
	fg = gold.mix(color.bat_shadow, 40),
}
M.vcs.diff_delete = {
	bg = crimson.mix(color.bat_black, 90),
	fg = crimson.mix(color.bat_shadow, 40),
}
M.vcs.diff_change = {
	bg = blue.mix(color.bat_black, 90),
	fg = blue.mix(color.bat_shadow, 40),
}
M.vcs.diff_text = {
	bg = color.bat_purple.mix(color.bat_black, 90),
	fg = color.bat_purple.lighten(10).mix(color.bat_shadow, 40),
}

M.vcs.sign = {
	add    = gold.mix(color.bat_shadow, 40),
	delete = crimson.mix(color.bat_shadow, 40),
	change = blue.mix(color.bat_shadow, 40),
}

---@class theme.diagnostics
M.diagnostics = {
	ok    = color.bat_slate.darken(10),
	hint  = color.bat_slate.darken(20),
	info  = blue.mix(color.bat_shadow, 40),
	warn  = amber.mix(color.bat_shadow, 40),
	error = crimson.mix(color.bat_shadow, 30),
}
M.diagnostics.virtual = {}
M.diagnostics.virtual.ok = {
	bg = color.bat_shadow.mix(color.bat_black, 70),
	fg = color.bat_slate.darken(10),
}
M.diagnostics.virtual.hint = {
	bg = color.bat_shadow.mix(color.bat_black, 70),
	fg = color.bat_slate.darken(20),
}
M.diagnostics.virtual.info = {
	bg = blue.mix(color.bat_black, 95),
	fg = blue.mix(color.bat_shadow, 40),
}
M.diagnostics.virtual.warn = {
	bg = amber.mix(color.bat_black, 95),
	fg = amber.mix(color.bat_shadow, 40),
}
M.diagnostics.virtual.error = {
	bg = crimson.mix(color.bat_black, 95),
	fg = crimson.mix(color.bat_shadow, 30),
}

---@class theme.plugins
M.plugins = {}
M.plugins.float = {
	bg = color.bat_shadow,
	fg = color.bat_slate,
}
M.plugins.telescope = {
	matching = gold,
}
M.plugins.flash = {
	label = color.bat_gold,  -- flash label needs to pop
}

---@class theme.lang
M.lang = {}
M.lang.xml = {
	tag      = color.bat_purple.lighten(20),
	tag_name = color.bat_purple.lighten(30),
	attrib   = color.bat_slate,
}

return M
