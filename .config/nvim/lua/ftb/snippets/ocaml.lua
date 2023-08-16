local ls = require("luasnip")
local s = ls.s
local t = ls.t
local i = ls.i
local f = ls.f
local d = ls.d
local sn = ls.sn
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("ocaml", {
	-- use `//` for comments
	s({
		trig = "//",
		snippetType = "autosnippet",
	}, { t("(* "), i(1), t(" *)"), i(0) }),

	-- module signature
	s("modi", fmt("module type {} = sig\n\t{}\nend", { i(1, "ModType"), i(0) })),
	-- module implementation
	s("mods", fmt("module {} : {} = struct\n\t{}\nend", { i(1, "ModName"), i(2, "ModType"), i(0) })),
	-- classic aux rec function
	s('aux', fmt([[let rec aux {} = function
	{}
in aux {}]], {i(1), i(0), i(2)})),
	-- option map
	s('omap', fmt('Option.map {} {}', {i(1, 'f'), i(2, 'o')})),
	-- result map
	s('rmap', fmt('Result.map {} {}', {i(1, 'f'), i(2, 'r')})),
	-- result bind
	s('rbind', fmt('Result.bind {} {}', {i(1, 'r'), i(2, 'f')})),

})
