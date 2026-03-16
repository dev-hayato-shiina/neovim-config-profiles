return {
	"crnvl96/lazydocker.nvim",
	lazy = true,
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<Leader>ld", "<Cmd>LazyDocker<CR>", desc = "LazyDocker" },
	},
}
