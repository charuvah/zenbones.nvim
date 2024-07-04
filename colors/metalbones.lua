local lush = require "lush"
local metalbones = require "metalbones"
lush(metalbones.make_specs())

vim.keymap.set("n", "<F5>", function()
	if vim.o.background == "light" then
		vim.cmd [[set bg=dark]]
	else
		vim.cmd [[set bg=light]]
	end
	vim.cmd [[colorscheme metalbones]]
	local lush = require "lush"
	local metalbones = require "metalbones"
	lush(metalbones.make_specs())
	require("lualine").setup { theme = "metalbones" }
end)
