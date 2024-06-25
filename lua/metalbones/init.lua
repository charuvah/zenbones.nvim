local colors_name = "metalbones"
vim.g.colors_name = colors_name

local generator = require "zenbones.specs"
local bg = vim.o.background
local lush = require "lush"
local theme = require("metalbones.theme")[bg]

local base_specs = generator.generate(theme.palette, bg, generator.get_global_config(colors_name, bg))

local specs = lush.extends({ base_specs }).with(function(injected_fns)
	local sym = injected_fns.sym
	return {
		--------------------------------------------------------------------------------
		-- Text & NonText
		--------------------------------------------------------------------------------
		Normal { base_specs.Number, fg = theme.ui.normal },
		Cursor { base_specs.Cursor, bg = theme.ui.cursor.bg, fg = theme.ui.cursor.fg },
		CursorLine { base_specs.CursorLine, bg = theme.ui.cursor.highlight },
		NonText { base_specs.NonText, fg = theme.ui.non_text },
		Visual { base_specs.Visual, bg = theme.ui.visual.bg },
		NvimTreeWinSeparator { base_specs.Visual, bg = theme.ui.visual.bg },
		--------------------------------------------------------------------------------
		-- Syntax
		--------------------------------------------------------------------------------
		Number { base_specs.Number, fg = theme.syntax.number },
		Float { base_specs.Float, fg = theme.syntax.float },
		Constant { base_specs.Constant, fg = theme.syntax.constant },
		Character { Constant },
		String { Constant },
		String { String },
		Type { base_specs.Type, fg = theme.syntax.type },
		Identifier { Type },
		Function { base_specs.Function, fg = theme.syntax.func },
		Keyword { base_specs.Keyword, fg = theme.syntax.keyword },
		Statement { Keyword },
		Label { Keyword },
		Exception { Keyword },
		Preaproc { Keyword },
		Delimiter { base_specs.Delimiter, fg = theme.syntax.punctuation.delimiter },
		Operator { Delimiter },
		Punctuation { Delimiter },
		Comment { base_specs.Comment, fg = theme.syntax.comment.fg },
		Todo { Comment, fg = theme.syntax.comment.todo },
		Question { Comment, fg = theme.syntax.comment.question },
		SpecialComment { Comment, fg = theme.syntax.comment.special },
		WildMenu { base_specs.WildMenu, bg = theme.syntax.wild_menu.bg },
		DiffAdd { base_specs.DiffAdd, bg = theme.vcs.diff_add.bg, fg = theme.vcs.diff_add.fg },
		DiffDelete { base_specs.DiffDelete, bg = theme.vcs.diff_delete.bg, fg = theme.vcs.diff_delete.fg },
		DiffChange { base_specs.DiffChange, bg = theme.vcs.diff_change.bg, fg = theme.vcs.diff_change.fg },
		DiffText { base_specs.DiffText, bg = theme.vcs.diff_text.bg, fg = theme.vcs.diff_text.fg },
		--------------------------------------------------------------------------------
		-- Telescope
		--------------------------------------------------------------------------------
		TelescopeMaching { Normal, fg = theme.plugins.telescope.matching },
		--------------------------------------------------------------------------------
		-- Languages
		--------------------------------------------------------------------------------
		xmlTag { base_specs.xmlTag, fg = theme.lang.xml.tag },
		xmlTagName { base_specs.xmlTagName, fg = theme.lang.xml.tag_name },
		xmlAttrib { base_specs.xmlAttrib, fg = theme.lang.xml.attrib },
		htmlTagName { xmlTagName },
		--------------------------------------------------------------------------------
		-- Diagnostics
		--------------------------------------------------------------------------------
		DiagnosticOk { base_specs.DiagnosticOk, fg = theme.diagnostics.ok },
		DiagnosticHint { base_specs.DiagnosticHint, fg = theme.diagnostics.hint },
		DiagnosticInfo { base_specs.DiagnosticInfo, fg = theme.diagnostics.info },
		DiagnosticError { base_specs.DiagnosticError, fg = theme.diagnostics.error },
		DiagnosticWarn { base_specs.DiagnosticWarn, fg = theme.diagnostics.warn },
		DiagnosticDeprecated { DiagnosticHint },
		DiagnosticUnnecessary { DiagnosticInfo },
		DiagnosticSignOk { DiagnosticOk },
		DiagnosticSignHint { DiagnosticHint },
		DiagnosticSignInfo { DiagnosticInfo },
		DiagnosticSignError { DiagnosticError },
		DiagnosticSignWarn { DiagnosticWarn },
		DiagnosticSignDeprecated { DiagnosticSignHint },
		DiagnosticSignUnnecessary { DiagnosticSignHint },
		DiagnosticVirtualTextOk {
			DiagnosticOk,
			bg = theme.diagnostics.virtual.ok.bg,
			fg = theme.diagnostics.virtual.ok.fg,
		},
		DiagnosticVirtualTextHint {
			DiagnosticHint,
			bg = theme.diagnostics.virtual.hint.bg,
			fg = theme.diagnostics.virtual.hint.fg,
		},
		DiagnosticVirtualTextInfo {
			DiagnosticInfo,
			bg = theme.diagnostics.virtual.info.bg,
			fg = theme.diagnostics.virtual.info.fg,
		},
		DiagnosticVirtualTextError {
			DiagnosticError,
			bg = theme.diagnostics.virtual.error.bg,
			fg = theme.diagnostics.virtual.error.fg,
		},
		DiagnosticVirtualTextWarn {
			DiagnosticWarn,
			bg = theme.diagnostics.virtual.warn.bg,
			fg = theme.diagnostics.virtual.warn.fg,
		},
		DiagnosticVirtualTextDeprecated { DiagnosticVirtualTextHint },
		DiagnosticVirtualTextUnnecessary { DiagnosticVirtualTextHint },
		DiagnosticUnderlineOk { base_specs.DiagnosticUnderlineOk, sp = DiagnosticOk.fg },
		DiagnosticUnderlineHint { base_specs.DiagnosticUnderlineHint, sp = DiagnosticHint.fg },
		DiagnosticUnderlineInfo { DiagnosticUnderlineHint },
		DiagnosticUnderlineError { base_specs.DiagnosticUnderlineError, sp = DiagnosticError.fg },
		DiagnosticUnderlineWarn { base_specs.DiagnosticUnderlineWarn, sp = DiagnosticWarn.fg },
		DiagnosticUnderlineDeprecated { DiagnosticUnderlineHint },
		DiagnosticUnderlineUnnecessary { DiagnosticUnderlineHint },
		--------------------------------------------------------------------------------
		-- Messages UI
		--------------------------------------------------------------------------------
		Search {
			base_specs.Search,
			bg = theme.ui.search.bg,
			fg = theme.ui.search.fg,
		},
		IncSearch {
			base_specs.IncSearch,
			bg = theme.ui.search_inc.bg,
			fg = theme.ui.search_inc.fg,
		},
		LineNr { base_specs.LineNr, fg = theme.ui.line_nr },
		CursorLineNr { base_specs.LineNr, fg = theme.ui.cursor.line_nr },
		MoreMsg { Constant, fg = theme.ui.more_msg },
		WarningMsg { base_specs.WarningMsg, fg = theme.ui.warning_msg },
		--------------------------------------------------------------------------------
		-- Tabs
		--------------------------------------------------------------------------------
		TabLine { base_specs.TabLine, bg = theme.ui.tab.line.bg, fg = theme.ui.tab.line.fg },
		TabLineSel { base_specs.TabLine, bg = theme.ui.tab.sel.bg, fg = theme.ui.tab.sel.fg },
		TabLineFill { base_specs.TabLine },
		--------------------------------------------------------------------------------
		-- Version Control
		--------------------------------------------------------------------------------
		GitSignsAdd { base_specs.GitSignsAdd, fg = theme.vcs.sign.add },
		GitSignsDelete { base_specs.GitSignsDelete, fg = theme.vcs.sign.delete },
		GitSignsChange { base_specs.GitSignsChange, fg = theme.vcs.sign.change },
		--------------------------------------------------------------------------------
		-- Treesitter
		--------------------------------------------------------------------------------
		---- Puncuation
		sym "@operator" { Punctuation, fg = theme.syntax.punctuation.operator },
		sym "@punctuation.bracket" { Punctuation, fg = theme.syntax.punctuation.bracket },
		sym "@punctuation.special" { Punctuation, fg = theme.syntax.punctuation.special },
		sym "@punctuation.delimiter" { Punctuation, fg = theme.syntax.punctuation.delimiter },
		sym "@constructor" { Punctuation, fg = theme.syntax.punctuation.constructor },
		---- Variable
		sym "@variable" { Normal, fg = theme.syntax.variable },
		sym "@variable.member" { Normal, fg = theme.syntax.member },
		sym "@property" { Normal, fg = theme.syntax.property },
		sym "@keyword" { Keyword },
		sym "@attribute" { Keyword },
		sym "@type" { Type },
		sym "@type.definition" { Type, fg = theme.syntax.typedef },
		sym "@label" { Label },
		sym "@constant" { Constant },
		sym "@boolean" { Number },
		sym "@number" { Number },
		-- Function
		sym "@function" { Function },
		sym "@function.method" { Function },
		sym "@function.call" { Function },
		sym "@function.method.call" { Function },
		sym "@variable.parameter" { Function, fg = theme.syntax.parameter },
		-- String
		sym "@string" { String },
		sym "@character" { String },
		sym "@string.escape" { String, fg = theme.syntax.string.escape },
		sym "@string.special" { String, fg = theme.syntax.string.special },
		sym "@string.regexp" { String, fg = theme.syntax.string.regexp },
		-- Comment
		sym "@comment" { Comment },
		sym "@comment.documentation" { Comment },
		sym "@comment.todo" { Comment, fg = theme.syntax.comment.todo },
		sym "@comment.note" { Comment, fg = theme.syntax.comment.note },
		sym "@comment.warn" { Comment, fg = theme.syntax.comment.warn },
		sym "@comment.error" { Comment, fg = theme.syntax.comment.error },
		-- Lsp
		sym "@lsp.type.keyword" { sym "@keyword" },
		sym "@lsp.type.function" { sym "@function" },
		sym "@lsp.type.variable" { sym "@variable" },
		sym "@lsp.type.operator" { sym "@operator" },
		sym "@lsp.type.type" { sym "@type" },
		sym "@lsp.type.string" { sym "@string" },
		sym "@lsp.type.number" { sym "@number" },
		sym "@lsp.type.boolean" { sym "@boolean" },
		sym "@lsp.type.enumMember" { sym "@variable.member" },
		-- Diff
		sym "@diff.plus" { DiffAdd },
		sym "@diff.minus" { DiffDelete },
		sym "@diff.delta" { DiffChange },
		-- Language: XML
		sym "@tag.xml" { xmlTagName },
		sym "@tag.delimiter.xml" { xmlTag },
		sym "@tag.attribute.xml" { xmlAttrib },
	}
end)

return specs
