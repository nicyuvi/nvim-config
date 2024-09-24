-- One Monokai - cpea2506/one_monokai.nvim
-- require("one_monokai").setup({
--     transparent = true,
--     colors = {},
--     themes = function(colors)
--         return {}
--     end,
--     italics = true,
-- })

-- One Dark - navarasu/onedark.nvim

require("onedark").setup({
	style = "warmer",
	transparent = "true",
	highlights = {
		["@comment"] = { fg = "#50C878" },
		["@punctuation.bracket"] = { fg = "#fff" },
		["@punctuation.delimiter"] = { fg = "#fff" },
	},
})

require("onedark").load()
