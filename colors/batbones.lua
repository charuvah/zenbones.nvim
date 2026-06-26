vim.g.colors_name = "batbones"

local lush = require "lush"
local batbones = require "batbones"
lush(batbones.make_specs())

vim.keymap.set("n", "<F5>", function()
	if vim.o.background == "light" then
		vim.cmd [[set bg=dark]]
	else
		vim.cmd [[set bg=light]]
	end
	package.loaded["batbones.palette"] = nil
	package.loaded["batbones.dark"] = nil
	package.loaded["batbones.light"] = nil
	package.loaded["batbones.theme"] = nil
	package.loaded["batbones"] = nil
	local lush = require "lush"
	local batbones = require "batbones"
	lush(batbones.make_specs())
	require("lualine").setup { theme = "batbones" }
end)
