local M = {}

local bit = require "bit"

local default_dist_dir = "dist/quicksilver.nvim"

local colorschemes = {
	{ source = "retrobones", target = "retrodust", ident = "retrodust" },
	{ source = "batbones", target = "batdust", ident = "batdust" },
	{ source = "carbones", target = "cardust", ident = "cardust" },
	{ source = "metalbones", target = "metaldust", ident = "metaldust" },
}

local attr_bits = {
	bold = 0,
	standout = 1,
	underline = 2,
	undercurl = 3,
	underdouble = 4,
	underdotted = 5,
	underdashed = 6,
	italic = 7,
	reverse = 8,
	strikethrough = 9,
	altfont = 10,
	nocombine = 11,
}

local term_names = {
	"black",
	"red",
	"green",
	"yellow",
	"blue",
	"magenta",
	"cyan",
	"white",
	"bright_black",
	"bright_red",
	"bright_green",
	"bright_yellow",
	"bright_blue",
	"bright_magenta",
	"bright_cyan",
	"bright_white",
}

local lualine_sections = {
	"normal",
	"insert",
	"command",
	"visual",
	"replace",
	"inactive",
}

local lualine_modes = {
	normal = { "a", "b", "c" },
	insert = { "a" },
	command = { "a" },
	visual = { "a" },
	replace = { "a" },
	inactive = { "a", "b", "c" },
}

local function write_file(path, content)
	vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")
	vim.fn.writefile(vim.split(content, "\n", { plain = true }), path)
end

local function cstr(value)
	if value == nil then
		return "NULL"
	end
	value = value:gsub("\\", "\\\\"):gsub('"', '\\"'):gsub("\n", "\\n"):gsub("\r", "\\r"):gsub("\t", "\\t")
	return string.format('"%s"', value)
end

local function color(value)
	if value == nil then
		return "-1"
	end
	return string.format("0x%06X", value)
end

local function parse_hex(value)
	local hex = assert(value:match "^#(%x%x%x%x%x%x)$", "invalid terminal color: " .. tostring(value))
	return tonumber(hex, 16)
end

local function hex(value)
	if value == nil then
		error "missing lualine color"
	end
	if type(value) == "string" then
		if value == "NONE" then
			return nil
		end
		assert(value:match "^#%x%x%x%x%x%x$", "invalid lualine color: " .. value)
		return value
	end
	assert(value.hex, "lualine color does not expose .hex: " .. vim.inspect(value))
	return value.hex
end

local function attrs_from_hl(hl)
	local attrs = 0
	for name, attr_bit in pairs(attr_bits) do
		if hl[name] then
			attrs = attrs + bit.lshift(1, attr_bit)
		end
	end
	return attrs
end

local function sorted_spec_names(specs)
	local names = {}
	for name in pairs(specs) do
		table.insert(names, name)
	end
	table.sort(names)
	return names
end

local function reset_modules(source)
	for name in pairs(package.loaded) do
		if name == source or name:match("^" .. vim.pesc(source) .. "%.") then
			package.loaded[name] = nil
		end
	end
end

local function make_lualine_theme(specs, background)
	local da = background == "light" and -3 or 3
	local common_fg = hex(specs.Folded.fg)
	local inactive_bg = hex(specs.StatusLineNC.bg)
	local inactive_fg = hex(specs.StatusLineNC.fg)

	return {
		normal = {
			a = { bg = hex(specs.PmenuSbar.bg.abs_da(da)), fg = common_fg, gui = "bold" },
			b = { bg = hex(specs.PmenuSel.bg.abs_da(da)), fg = common_fg },
			c = { bg = hex(specs.StatusLine.bg.abs_da(da)), fg = hex(specs.StatusLine.fg) },
		},
		insert = {
			a = { bg = hex(specs.DiffText.bg), fg = common_fg, gui = "bold" },
		},
		command = {
			a = { bg = hex(specs.Search.bg), fg = common_fg, gui = "bold" },
		},
		visual = {
			a = { bg = hex(specs.Visual.bg), fg = common_fg, gui = "bold" },
		},
		replace = {
			a = { bg = hex(specs.DiffDelete.bg), fg = common_fg, gui = "bold" },
		},
		inactive = {
			a = { bg = inactive_bg, fg = inactive_fg, gui = "bold" },
			b = { bg = inactive_bg, fg = inactive_fg },
			c = { bg = inactive_bg, fg = inactive_fg },
		},
	}
end

local function make_theme(config, background)
	reset_modules(config.source)
	vim.g.colors_name = config.source
	vim.o.background = background
	vim.cmd "highlight clear"

	local source = require(config.source)
	local specs = source.make_specs()
	require("lush")(specs, { force_clean = false })

	local highlights = {}
	for _, name in ipairs(sorted_spec_names(specs)) do
		local linked = vim.api.nvim_get_hl(0, { name = name, link = true })
		if linked.link then
			table.insert(highlights, {
				name = name,
				link = linked.link,
			})
		else
			local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
			table.insert(highlights, {
				name = name,
				fg = hl.fg,
				bg = hl.bg,
				sp = hl.sp,
				attrs = attrs_from_hl(hl),
				blend = hl.blend,
			})
		end
	end

	local theme = require(config.source .. ".theme")[background]
	local term = require("zenbones.term").colors_map(theme.palette)
	local terminal = {}
	for _, name in ipairs(term_names) do
		table.insert(terminal, parse_hex(term[name].hex))
	end

	return {
		highlights = highlights,
		terminal = terminal,
		lualine = make_lualine_theme(specs, background),
	}
end

local function render_highlight_array(name, highlights)
	local lines = {
		string.format("static const qs_hl %s[] = {", name),
	}

	for _, hl in ipairs(highlights) do
		table.insert(
			lines,
			string.format(
				"  { %s, %s, %s, %s, %s, 0x%04X, %s },",
				cstr(hl.name),
				cstr(hl.link),
				color(hl.fg),
				color(hl.bg),
				color(hl.sp),
				hl.attrs or 0,
				hl.blend or -1
			)
		)
	end

	table.insert(lines, "};")
	return table.concat(lines, "\n")
end

local function render_terminal_array(name, terminal)
	local values = {}
	for _, value in ipairs(terminal) do
		table.insert(values, string.format("0x%06X", value))
	end
	return string.format("static const int %s[16] = { %s };", name, table.concat(values, ", "))
end

local function render_theme_arrays(config, theme)
	local dark_hl = "qs_" .. config.ident .. "_dark_highlights"
	local dark_term = "qs_" .. config.ident .. "_dark_terminal"
	local dark_theme = "qs_" .. config.ident .. "_dark_theme"
	local light_hl = "qs_" .. config.ident .. "_light_highlights"
	local light_term = "qs_" .. config.ident .. "_light_terminal"
	local light_theme = "qs_" .. config.ident .. "_light_theme"

	return table.concat({
		render_highlight_array(dark_hl, theme.dark.highlights),
		render_terminal_array(dark_term, theme.dark.terminal),
		string.format(
			"static const qs_theme %s = { %s, sizeof(%s) / sizeof(%s[0]), %s };",
			dark_theme,
			dark_hl,
			dark_hl,
			dark_hl,
			dark_term
		),
		render_highlight_array(light_hl, theme.light.highlights),
		render_terminal_array(light_term, theme.light.terminal),
		string.format(
			"static const qs_theme %s = { %s, sizeof(%s) / sizeof(%s[0]), %s };",
			light_theme,
			light_hl,
			light_hl,
			light_hl,
			light_term
		),
	}, "\n\n")
end

local function render_registry(themes)
	local lines = {
		"static const qs_colorscheme qs_colorschemes[] = {",
	}

	for _, config in ipairs(colorschemes) do
		assert(themes[config.target], "missing generated theme: " .. config.target)
		table.insert(
			lines,
			string.format(
				"  { %s, &qs_%s_dark_theme, &qs_%s_light_theme },",
				cstr(config.target),
				config.ident,
				config.ident
			)
		)
	end

	table.insert(lines, "};")
	return table.concat(lines, "\n")
end

local function render_c(themes)
	local chunks = {}
	for _, config in ipairs(colorschemes) do
		table.insert(chunks, render_theme_arrays(config, themes[config.target]))
	end

	return string.format(
		[[
/* This file is auto-generated from bones themes. Do not edit by hand. */
#include <stddef.h>
#include <stdio.h>
#include <string.h>

#include <lua.h>
#include <lauxlib.h>

#define QS_ATTR_BOLD          (1u << 0)
#define QS_ATTR_STANDOUT      (1u << 1)
#define QS_ATTR_UNDERLINE     (1u << 2)
#define QS_ATTR_UNDERCURL     (1u << 3)
#define QS_ATTR_UNDERDOUBLE   (1u << 4)
#define QS_ATTR_UNDERDOTTED   (1u << 5)
#define QS_ATTR_UNDERDASHED   (1u << 6)
#define QS_ATTR_ITALIC        (1u << 7)
#define QS_ATTR_REVERSE       (1u << 8)
#define QS_ATTR_STRIKETHROUGH (1u << 9)
#define QS_ATTR_ALTFONT       (1u << 10)
#define QS_ATTR_NOCOMBINE     (1u << 11)

typedef struct {
  const char *name;
  const char *link;
  int fg;
  int bg;
  int sp;
  unsigned attrs;
  int blend;
} qs_hl;

typedef struct {
  const qs_hl *highlights;
  size_t highlight_count;
  const int *terminal;
} qs_theme;

typedef struct {
  const char *name;
  const qs_theme *dark;
  const qs_theme *light;
} qs_colorscheme;

%s

%s

static void qs_push_vim_field(lua_State *L, const char *field)
{
  lua_getglobal(L, "vim");
  if (!lua_istable(L, -1)) {
    luaL_error(L, "quicksilver requires Neovim's vim global");
  }
  lua_getfield(L, -1, field);
  lua_remove(L, -2);
}

static void qs_push_nvim_set_hl(lua_State *L)
{
  qs_push_vim_field(L, "api");
  lua_getfield(L, -1, "nvim_set_hl");
  lua_remove(L, -2);
  if (!lua_isfunction(L, -1)) {
    luaL_error(L, "vim.api.nvim_set_hl is unavailable");
  }
}

static void qs_set_bool(lua_State *L, const char *key, int enabled)
{
  if (enabled) {
    lua_pushboolean(L, 1);
    lua_setfield(L, -2, key);
  }
}

static void qs_set_color(lua_State *L, const char *key, int value)
{
  if (value >= 0) {
    lua_pushinteger(L, value);
    lua_setfield(L, -2, key);
  }
}

static void qs_set_highlight_opts(lua_State *L, const qs_hl *hl)
{
  lua_newtable(L);

  if (hl->link != NULL) {
    lua_pushstring(L, hl->link);
    lua_setfield(L, -2, "link");
    return;
  }

  qs_set_color(L, "fg", hl->fg);
  qs_set_color(L, "bg", hl->bg);
  qs_set_color(L, "sp", hl->sp);

  qs_set_bool(L, "bold", hl->attrs & QS_ATTR_BOLD);
  qs_set_bool(L, "standout", hl->attrs & QS_ATTR_STANDOUT);
  qs_set_bool(L, "underline", hl->attrs & QS_ATTR_UNDERLINE);
  qs_set_bool(L, "undercurl", hl->attrs & QS_ATTR_UNDERCURL);
  qs_set_bool(L, "underdouble", hl->attrs & QS_ATTR_UNDERDOUBLE);
  qs_set_bool(L, "underdotted", hl->attrs & QS_ATTR_UNDERDOTTED);
  qs_set_bool(L, "underdashed", hl->attrs & QS_ATTR_UNDERDASHED);
  qs_set_bool(L, "italic", hl->attrs & QS_ATTR_ITALIC);
  qs_set_bool(L, "reverse", hl->attrs & QS_ATTR_REVERSE);
  qs_set_bool(L, "strikethrough", hl->attrs & QS_ATTR_STRIKETHROUGH);
  qs_set_bool(L, "altfont", hl->attrs & QS_ATTR_ALTFONT);
  qs_set_bool(L, "nocombine", hl->attrs & QS_ATTR_NOCOMBINE);

  if (hl->blend >= 0) {
    lua_pushinteger(L, hl->blend);
    lua_setfield(L, -2, "blend");
  }
}

static const qs_colorscheme *qs_find_colorscheme(const char *name)
{
  size_t count = sizeof(qs_colorschemes) / sizeof(qs_colorschemes[0]);

  for (size_t i = 0; i < count; i++) {
    if (strcmp(qs_colorschemes[i].name, name) == 0) {
      return &qs_colorschemes[i];
    }
  }

  return NULL;
}

static void qs_apply_highlights(lua_State *L, const qs_theme *theme)
{
  for (size_t i = 0; i < theme->highlight_count; i++) {
    const qs_hl *hl = &theme->highlights[i];
    qs_push_nvim_set_hl(L);
    lua_pushinteger(L, 0);
    lua_pushstring(L, hl->name);
    qs_set_highlight_opts(L, hl);

    if (lua_pcall(L, 3, 0, 0) != 0) {
      luaL_error(L, "failed to set highlight %%s: %%s", hl->name, lua_tostring(L, -1));
    }
  }
}

static void qs_apply_terminal_colors(lua_State *L, const qs_theme *theme)
{
  char key[32];
  char value[8];

  qs_push_vim_field(L, "g");
  for (int i = 0; i < 16; i++) {
    snprintf(key, sizeof(key), "terminal_color_%%d", i);
    snprintf(value, sizeof(value), "#%%06X", theme->terminal[i]);
    lua_pushstring(L, value);
    lua_setfield(L, -2, key);
  }
  lua_pop(L, 1);
}

static int qs_load(lua_State *L)
{
  const char *name = luaL_optstring(L, 1, "metaldust");
  const char *background = luaL_optstring(L, 2, "dark");
  const qs_colorscheme *colorscheme = qs_find_colorscheme(name);

  if (colorscheme == NULL) {
    luaL_error(L, "unknown quicksilver colorscheme: %%s", name);
  }

  const qs_theme *theme = strcmp(background, "light") == 0 ? colorscheme->light : colorscheme->dark;

  qs_apply_terminal_colors(L, theme);
  qs_apply_highlights(L, theme);

  return 0;
}

int luaopen_quicksilver_native(lua_State *L)
{
  lua_newtable(L);
  lua_pushcfunction(L, qs_load);
  lua_setfield(L, -2, "load");
  return 1;
}
]],
		table.concat(chunks, "\n\n"),
		render_registry(themes)
	)
end

local function render_lualine_component(component)
	local fields = {}
	for _, key in ipairs { "bg", "fg", "gui" } do
		if component[key] ~= nil then
			table.insert(fields, string.format("%s = %q", key, component[key]))
		end
	end
	return "{ " .. table.concat(fields, ", ") .. " }"
end

local function render_lualine_theme(theme)
	local lines = {
		"-- This file is auto-generated by quicksilver.nvim",
		"return {",
	}

	for _, section in ipairs(lualine_sections) do
		table.insert(lines, string.format("\t%s = {", section))
		for _, mode in ipairs(lualine_modes[section]) do
			table.insert(lines, string.format("\t\t%s = %s,", mode, render_lualine_component(theme[section][mode])))
		end
		table.insert(lines, "\t},")
	end

	table.insert(lines, "}")
	return table.concat(lines, "\n")
end

local function render_lualine_entry(name)
	return string.format(
		[[
local background = vim.o.background == "light" and "light" or "dark"
return require("lualine.themes.%s_" .. background)
]],
		name
	)
end

local function runtime_init()
	return [[
local M = {}

function M.load(name, background)
	name = name or "metaldust"
	background = background or vim.o.background
	require("quicksilver.native").load(name, background)
end

return M
]]
end

local function colorscheme_entry(name)
	return string.format(
		[[
if vim.g.colors_name then
	vim.cmd "highlight clear"
end

vim.g.colors_name = %s
require("quicksilver").load(%s, vim.o.background)
]],
		string.format("%q", name),
		string.format("%q", name)
	)
end

local function readme()
	return [[
# quicksilver.nvim

Standalone generated C bundle for retrodust, batdust, cardust, and metaldust.

This directory is generated by the zenbones.nvim source tree. Runtime does not
depend on zenbones, bones source themes, Lush, or Shipwright.
]]
end

function M.generate(opts)
	opts = opts or {}
	local dist_dir = opts.dist_dir or default_dist_dir
	local native_dir = dist_dir .. "/lua/quicksilver"
	local lualine_dir = dist_dir .. "/lua/lualine/themes"

	local themes = {}
	for _, config in ipairs(colorschemes) do
		themes[config.target] = {
			dark = make_theme(config, "dark"),
			light = make_theme(config, "light"),
		}
	end

	vim.fn.mkdir(native_dir, "p")
	vim.fn.mkdir(lualine_dir, "p")
	vim.fn.mkdir(dist_dir .. "/colors", "p")

	write_file(native_dir .. "/native.c", render_c(themes))
	write_file(native_dir .. "/init.lua", runtime_init())
	vim.fn.delete(dist_dir .. "/colors/quicksilver.lua")
	for _, config in ipairs(colorschemes) do
		write_file(dist_dir .. "/colors/" .. config.target .. ".lua", colorscheme_entry(config.target))
		write_file(lualine_dir .. "/" .. config.target .. ".lua", render_lualine_entry(config.target))
		write_file(lualine_dir .. "/" .. config.target .. "_dark.lua", render_lualine_theme(themes[config.target].dark.lualine))
		write_file(lualine_dir .. "/" .. config.target .. "_light.lua", render_lualine_theme(themes[config.target].light.lualine))
	end
	write_file(dist_dir .. "/README.md", readme())
end

function M.generate_or_exit()
	local ok, err = xpcall(function()
		M.generate()
	end, debug.traceback)
	if not ok then
		vim.api.nvim_err_writeln(err)
		vim.cmd "cquit 1"
	end
end

return M
