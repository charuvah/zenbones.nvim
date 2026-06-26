vim.g.colors_name = "carbones"

local lush = require "lush"
local carbones = require "carbones"
lush(carbones.make_specs())

vim.keymap.set("n", "<F5>", function()
	if vim.o.background == "light" then
		vim.cmd [[set bg=dark]]
	else
		vim.cmd [[set bg=light]]
	end
	package.loaded["carbones.palette"] = nil
	package.loaded["carbones.dark"] = nil
	package.loaded["carbones.light"] = nil
	package.loaded["carbones.theme"] = nil
	package.loaded["carbones"] = nil
	local lush = require "lush"
	local carbones = require "carbones"
	lush(carbones.make_specs())
	require("lualine").setup { theme = "carbones" }
end)
