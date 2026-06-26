vim.g.colors_name = "metalbones"

local lush = require "lush"
local metalbones = require "metalbones"
lush(metalbones.make_specs())

vim.keymap.set("n", "<F5>", function()
	if vim.o.background == "light" then
		vim.cmd [[set bg=dark]]
	else
		vim.cmd [[set bg=light]]
	end
	package.loaded["metalbones.palette"] = nil
	package.loaded["metalbones.dark"] = nil
	package.loaded["metalbones.light"] = nil
	package.loaded["metalbones.theme"] = nil
	package.loaded["metalbones"] = nil
	local lush = require "lush"
	local metalbones = require "metalbones"
	lush(metalbones.make_specs())
	require("lualine").setup { theme = "metalbones" }
end)
