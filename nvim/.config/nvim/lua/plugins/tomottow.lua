return {
	"paul-han-gh/tomorrow.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("tomorrow").setup({
			compile = false, -- enable compiling the colorscheme
			undercurl = true, -- enable undercurls
			commentStyle = { italic = true },
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			transparent = true, -- do not set background color
			dimInactive = true, -- dim inactive window `:h hl-NormalNC`
			colors = {}, -- add/modify theme and palette colors
			overrides = function(colors) -- add/modify highlights
				return {}
			end,
		})
		vim.cmd("colorscheme tomorrow-night")

		local groups = {
			"Normal",
			"NormalNC",
			"NormalFloat",
			"FloatBorder",
			"SignColumn",
			"NonText",
			"EndOfBuffer",
		}
		for _, name in ipairs(groups) do
			vim.api.nvim_set_hl(0, name, { bg = "none" })
		end
	end,
}
