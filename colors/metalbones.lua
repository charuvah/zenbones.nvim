local lush = require "lush"
local specs = require "metalbones"
lush(specs)

vim.keymap.set("n", "<F5>", function()
	if vim.o.background == "light" then
		vim.o.background = "dark"
	else
		vim.o.background = "light"
	end
	local lush = require "lush"
	local specs = require "metalbones"
	print(vim.inspect(specs))
	lush(specs)
	require("lualine").setup { theme = "metalbones" }
end)
