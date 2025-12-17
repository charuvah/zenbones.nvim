local lush = require "lush"
local retrobones = require "retrobones"
lush(retrobones.make_specs())

vim.keymap.set("n", "<F5>", function()
	package.loaded["retrobones.palette"] = nil
	package.loaded["retrobones.dark"] = nil
	package.loaded["retrobones.light"] = nil
	package.loaded["retrobones.theme"] = nil
	package.loaded["retrobones"] = nil
	local lush = require "lush"
	local retrobones = require "retrobones"
	lush(retrobones.make_specs())
	vim.cmd [[set bg=dark]]
	vim.cmd [[colorscheme retrobones]]
	require("lualine").setup { theme = "retrobones" }
end)
