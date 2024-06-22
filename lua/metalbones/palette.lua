local util = require "zenbones.util"
local lush = require "lush"
local hsluv = lush.hsluv

local M = {}

M.light = util.palette_extend({
	bg = hsluv(0, 0, 94), -- sand
	fg = hsluv(0, 0, 22), -- stone
}, "light")

M.dark = util.palette_extend({
	bg = hsluv(0, 0, 9), -- sand
	fg = hsluv(0, 0, 76), -- stone
	khold = hsluv "#974b46",
	bathory = hsluv "#e78a53",
	metalred = hsluv "#835d5a",
	metalgreen = hsluv "#628282",
	metalblue = hsluv "#5f81a5",
	metalyellow = hsluv "#915a39",
	metalblack = hsluv "#000000",
	metalgray0 = hsluv "#0a0a0a",
	metalgray1 = hsluv "#121212",
	metalgray2 = hsluv "#222222",
	metalgray3 = hsluv "#4f4f4f",
	metalgray4 = hsluv "#5f5f5f",
	metalgray5 = hsluv "#919191",
	metalgray6 = hsluv "#a1a1a1",
	metalgray7 = hsluv "#c1c1c1",
}, "dark")

return M
