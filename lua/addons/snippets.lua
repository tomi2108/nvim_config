local load_snippets = function()
	local ls = require("luasnip")
	local s = ls.snippet
	local t = ls.text_node
	local i = ls.insert_node

	ls.add_snippets({ "typescript", "javascript", "typescriptreact", "javascriptreact" }, {
		s("dest", {
			t("const { "),
			i(2),
			t(" } = "),
			i(1),
		}),
	})
	ls.add_snippets({ "typescript", "javascript", "typescriptreact", "javascriptreact" }, {
		s("destb", {
			t("const ["),
			i(2),
			t("] = "),
			i(1),
		}),
	})
end

return { load_snippets = load_snippets }
