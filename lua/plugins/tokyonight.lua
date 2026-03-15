return {
	"folke/tokyonight.nvim",
	lazy = false,
	config = function()
		require("tokyonight").setup({
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			on_highlights = function(hl, c)
				-- コマンドラインで highlight で Enter を押下することで、詳細確認可能
				-- :filter /^Neo/ highlight

				-- Line
				hl.LineNr = { fg = "#828bb8", bold = true }

				-- CursorLine
				hl.CursorLine = { bg = "NONE" }
				hl.CursorLineNr = { fg = c.orange, bold = true }

				-- File
				hl.NeoTreeNormal = { bg = "NONE" }
				hl.NeoTreeNormalNC = { bg = "NONE" }
			end,
		})
		vim.cmd.colorscheme("tokyonight-moon")
	end,
}
