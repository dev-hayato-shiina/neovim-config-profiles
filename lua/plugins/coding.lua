return {

	-- Mason: ツール管理の基盤
	{
		"mason-org/mason.nvim",
		lazy = false,
		opts = {},
	},

	-- Mason <-> nvim-lspconfig のブリッジ
	-- LSP サーバーを lspconfig に自動接続する
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},

	-- Mason でインストールするツールを一元管理する
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				-- Lua - Formatter
				"stylua",
			},
		},
	},

	-- Formatter: 保存時に自動整形する
	{
		"stevearc/conform.nvim",
		lazy = false,
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
			format_on_save = {
				timeout_ms = 3000,
				lsp_fallback = true, -- Formatter がない場合は LSP のフォーマットにフォールバックする
			},
		},
	},

	-- Linter: 保存時・読込時にコード品質をチェックする
	{
		"mfussenegger/nvim-lint",
		lazy = false,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {}

			-- 保存時・読込時に lint を実行する
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},

	-- スニペットエンジン: 展開・タブ移動・動的プレースホルダーを処理する
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	dependencies = {
	-- 		-- VSCode 形式のスニペットデータ集
	-- 		"rafamadriz/friendly-snippets",
	-- 	},
	-- 	config = function()
	-- 		require("luasnip.loaders.from_vscode").lazy_load()
	-- 	end,
	-- },

	-- DAP エンジン: DAP プロトコルでデバッガーと通信する
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- Mason と nvim-dap を繋ぐブリッジ
			-- Mason でインストールしたアダプターを nvim-dap に自動登録する
			{
				"jay-babu/mason-nvim-dap.nvim",
				opts = { handlers = {} },
			},
			-- DAP の情報をウィンドウとして描画する UI 層
			{
				"rcarriga/nvim-dap-ui",
				dependencies = { "nvim-neotest/nvim-nio" },
				config = function()
					local dap = require("dap")
					local dapui = require("dapui")

					dapui.setup()

					-- デバッグ開始・終了時に UI を自動で開閉する
					dap.listeners.after.event_initialized["dapui_config"] = dapui.open
					dap.listeners.before.event_terminated["dapui_config"] = dapui.close
					dap.listeners.before.event_exited["dapui_config"] = dapui.close
				end,
			},
		},
	},

	-- AST ベースのパーサー: シンタックスハイライト・インデントを提供する
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "lua" },
			highlight = { enable = true },
			indent = { enable = true },
		},
	},

	-- Treesitter の AST を利用して関数・クラス・引数単位のテキストオブジェクトを提供する
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
			},
		},
	},

	-- 補完UI: LSP・スニペット・パス・バッファ内単語を束ねてポップアップ表示する
	-- {
	-- 	"Saghen/blink.cmp",
	-- 	lazy = false,
	-- 	version = "1.*",
	-- 	dependencies = { "L3MON4D3/LuaSnip" },
	-- 	opts = {
	-- 		completion = {
	-- 			menu = {
	-- 				border = "rounded",
	-- 			},
	-- 			documentation = {
	-- 				window = {
	-- 					border = "rounded",
	-- 				},
	-- 			},
	-- 		},
	-- 		signature = {
	-- 			window = {
	-- 				border = "rounded",
	-- 			},
	-- 		},
	-- 		fuzzy = { implementation = "lua" },
	-- 		snippets = { preset = "luasnip" },
	-- 		sources = {
	-- 			default = { "lsp", "path", "snippets", "buffer" },
	-- 		},
	-- 		keymap = {
	-- 			preset = "default",
	-- 			["<CR>"] = { "accept", "fallback" },
	-- 		},
	-- 	},
	-- },

	-- 括弧・クォートを自動で閉じる
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	-- 括弧・クォート・タグを追加・変更・削除する
	-- cs"' で " を ' に変換 / ds" で削除 / ysiw" で囲む
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		opts = {},
	},

	-- Treesitter ベースのコメントアウト
	-- gcc で行コメント / gc でビジュアル選択範囲をコメントアウト
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- ファイル検索・grep・バッファ・コマンド履歴などを fzf で検索する
	{
		"ibhagwan/fzf-lua",
		lazy = false,
		opts = {},
	},
}
