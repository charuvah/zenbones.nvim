local generator = require "zenbones.specs"
local bg = vim.o.background
local lush = require "lush"
local palette = require("metalbones.palette")[bg]

local base_specs = generator.generate(palette, bg, generator.get_global_config("metalbones", bg))

local specs = lush.extends({ base_specs }).with(function(injected_fns)
	local sym = injected_fns.sym
	return {
		--------------------------------------------------------------------------------
		-- Text & NonText
		--------------------------------------------------------------------------------
		Normal { base_specs.Normal, fg = palette.metal_gray5 },
		Cursor { base_specs.Cursor, bg = palette.metal_silver, fg = palette.metal_gray1 },
		CursorLine { base_specs.CursorLine, bg = palette.metal_gray1.lighten(2) },
		NonText { base_specs.NonText, fg = palette.metal_gray3.darken(30) },
		Visual { base_specs.Visual, bg = palette.metal_gray2.darken(30) },
		--------------------------------------------------------------------------------
		-- Syntax
		--------------------------------------------------------------------------------
		Number { base_specs.Number, fg = palette.metal_rust },
		Float { base_specs.Float, fg = palette.metal_rust.lighten(10) },
		Constant { base_specs.Constant, fg = palette.metal_steel.mix(palette.metal_gray2, 25) },
		Character { Constant },
		String { Constant },
		String { String },
		Type { base_specs.Type, fg = palette.metal_gray4 },
		Identifier { Type },
		Function { base_specs.Function, fg = palette.metal_gray4.darken(50) },
		Keyword { base_specs.Keyword, fg = palette.metal_gray3.lighten(10) },
		Statement { Keyword },
		Label { Keyword },
		Exception { Keyword },
		Preaproc { Keyword },
		Delimiter { base_specs.delimiter, fg = palette.metal_gray3.lighten(10) },
		Operator { Delimiter },
		Punctuation { Delimiter },
		Comment { base_specs.Comment, fg = palette.metal_gray2.lighten(8) },
		Todo { Comment, fg = palette.metal_barthelo.mix(palette.metal_gray2, 70) },
		Question { Comment, fg = palette.metal_electric.mix(palette.metal_gray2, 50) },
		SpecialComment { Comment, fg = palette.metal_barthory.mix(palette.metal_gray2, 70) },
		WildMenu { base_specs.WildMenu, bg = palette.metal_rose.darken(50) },
		DiffAdd {
			base_specs.DiffAdd,
			fg = palette.metal_nile.mix(palette.metal_gray2, 30),
			bg = palette.metal_nile.mix(palette.metal_black, 85),
		},
		DiffDelete {
			base_specs.DiffDelete,
			fg = palette.metal_thorn.mix(palette.metal_gray2, 30),
			bg = palette.metal_thorn.mix(palette.metal_black, 85),
		},
		DiffChange {
			base_specs.DiffChange,
			fg = palette.metal_electric.mix(palette.metal_gray2, 30),
			bg = palette.metal_electric.mix(palette.metal_black, 85),
		},
		DiffText {
			base_specs.DiffText,
			fg = palette.metal_gray4.mix(palette.metal_gray2, 30),
			bg = palette.metal_gray4.mix(palette.metal_black, 90),
		},
		--------------------------------------------------------------------------------
		-- Telescope
		--------------------------------------------------------------------------------
		TelescopeMatching { Normal, fg = palette.metal_rose.darken(10) },
		--------------------------------------------------------------------------------
		-- Languages
		--------------------------------------------------------------------------------
		xmlTag { base_specs.xmlTag, fg = palette.metal_gray3 },
		xmlTagName { base_specs.xmlTagName, fg = palette.metal_gray3.lighten(10) },
		xmlAttrib { base_specs.xmlAttrib, fg = palette.metal_gray3.lighten(30) },
		htmlTagName { xmlTagName },
		--------------------------------------------------------------------------------
		-- Treesitter
		--------------------------------------------------------------------------------
		---- Puncuation
		sym "@operator" { Punctuation },
		sym "@punctuation.bracket" { Punctuation, fg = palette.metal_gray3.lighten(10) },
		sym "@punctuation.special" { Punctuation, fg = palette.metal_gray3.lighten(10) },
		sym "@punctuation.delimiter" { Punctuation, fg = palette.metal_gray3.lighten(10) },
		sym "@constructor" { Punctuation, fg = palette.metal_gray3.lighten(10) },
		---- Variable
		sym "@variable" { Normal, fg = palette.metal_gray5.darken(20) },
		sym "@variable.member" { Normal, fg = palette.metal_gray5.darken(40) },
		sym "@property" { Normal, fg = palette.metal_gray5.darken(40) },
		sym "@keyword" { Keyword },
		sym "@attribute" { Keyword },
		sym "@type" { Type },
		sym "@type.definition" { Type, fg = palette.metal_gray4.lighten(10) },
		sym "@label" { Label },
		sym "@constant" { Constant },
		sym "@boolean" { Number },
		sym "@number" { Number },
		-- Function
		sym "@function" { Function },
		sym "@function.method" { Function },
		sym "@function.call" { Function },
		sym "@function.method.call" { Function },
		sym "@variable.parameter" { Function, fg = palette.metal_gray4.darken(20) },
		-- String
		sym "@string" { String },
		sym "@character" { String },
		sym "@string.escape" { String, fg = palette.metal_steel.darken(50) },
		sym "@string.special" { String, fg = palette.metal_steel.darken(50) },
		sym "@string.regexp" { String, fg = palette.metal_electric },
		-- Comment
		sym "@comment" { Comment },
		sym "@comment.documentation" { Comment },
		sym "@comment.todo" { Comment, fg = palette.metal_barthelo.darken(70) },
		sym "@comment.note" { Comment, fg = palette.metal_electric.darken(50) },
		sym "@comment.warn" { Comment, fg = palette.metal_barthory.darken(70) },
		sym "@comment.error" { Comment, fg = palette.metal_rust.darken(70) },
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
		--------------------------------------------------------------------------------
		-- Diagnostics
		--------------------------------------------------------------------------------
		DiagnosticOk { base_specs.DiagnosticOk, fg = palette.metal_nile.mix(palette.metal_gray2, 30) },
		DiagnosticHint { base_specs.DiagnosticHint, fg = palette.metal_gray3.darken(20) },
		DiagnosticInfo { base_specs.DiagnosticInfo, fg = palette.metal_electric.mix(palette.metal_gray2, 30) },
		DiagnosticError { base_specs.DiagnosticError, fg = palette.metal_rust.mix(palette.metal_gray2, 60) },
		DiagnosticWarn { base_specs.DiagnosticWarn, fg = palette.metal_barthory.mix(palette.metal_gray2, 70) },
		DiagnosticDeprecated { DiagnosticHint },
		DiagnosticUnnecessary { DiagnosticInfo },
		DiagnosticSignOk { DiagnosticOk },
		DiagnosticSignHint { DiagnosticHint },
		DiagnosticSignInfo { DiagnosticInfo },
		DiagnosticSignError { DiagnosticError },
		DiagnosticSignWarn { DiagnosticWarn },
		DiagnosticSignDeprecated { DiagnosticSignHint },
		DiagnosticSignUnnecessary { DiagnosticSignHint },
		DiagnosticVirtualTextOk { DiagnosticOk, bg = palette.metal_nile.mix(palette.metal_black, 85) },
		DiagnosticVirtualTextHint { DiagnosticHint, bg = palette.metal_gray3.mix(palette.metal_black, 80) },
		DiagnosticVirtualTextInfo { DiagnosticInfo, bg = palette.metal_electric.mix(palette.metal_black, 85) },
		DiagnosticVirtualTextError { DiagnosticError, bg = palette.metal_rust.mix(palette.metal_black, 90) },
		DiagnosticVirtualTextWarn { DiagnosticWarn, bg = palette.metal_barthory.mix(palette.metal_black, 95) },
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
			bg = palette.metal_stone.mix(palette.metal_gray2, 50).darken(10),
			fg = palette.metal_gray1,
		},
		IncSearch {
			base_specs.IncSearch,
			bg = palette.metal_barthory.mix(palette.metal_gray2, 50).darken(10),
			fg = palette.metal_gray1,
		},
		LineNr { base_specs.LineNr, fg = palette.metal_gray3.darken(30) },
		CursorLineNr { base_specs.LineNr, fg = palette.metal_gray5.darken(30) },
		MoreMsg { Constant, fg = palette.metal_steel.mix(palette.metal_gray2, 20) },
		WarningMsg { base_specs.WarningMsg, fg = palette.metal_barthory.mix(palette.metal_gray2, 50) },
		--------------------------------------------------------------------------------
		-- Tabs
		--------------------------------------------------------------------------------
		TabLine { base_specs.TabLine, bg = palette.metal_gray0, fg = palette.metal_gray3 },
		TabLineSel { base_specs.TabLine, bg = palette.metal_gray1, fg = palette.metal_thorn },
		TabLineFill { base_specs.TabLine },
		--------------------------------------------------------------------------------
		-- Version Control
		--------------------------------------------------------------------------------
		GitSignsAdd { base_specs.GitSignsAdd, fg = palette.metal_gray2 },
		GitSignsDelete { base_specs.GitSignsDelete, fg = palette.metal_thorn.darken(50) },
		GitSignsChange { base_specs.GitSignsDelete, fg = palette.metal_electric.darken(50) },
	}
end)

return specs
