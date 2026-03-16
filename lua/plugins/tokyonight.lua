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

				-- Buffer
				--  hl.BufferCurrent = { bg = "NONE", bold = true }
				--  hl.BufferCurrentSign = { bg = "NONE" }
				--  hl.BufferCurrentMod = { bg = "NONE" }
				--  hl.BufferInactive = { bg = "NONE", fg = c.dark5 }
				--  hl.BufferInactiveSign = { bg = "NONE" }
				--  hl.BufferInactiveMod = { bg = "NONE" }
				hl.BufferVisible = { bg = "NONE" }
				hl.BufferVisibleSign = { bg = "NONE" }
				hl.BufferTabpages = { bg = "NONE" }
				hl.BufferTabpageFill = { bg = "NONE" }
				hl.BufferOffset = { bg = "NONE" }
			end,
		})
		vim.cmd.colorscheme("tokyonight-moon")
	end,
}
