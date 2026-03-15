vim.cmd("language en_US.UTF-8")

local opt = vim.opt

-- ===== ファイル =====

opt.fileencoding = "utf-8" -- ファイルの文字コード
opt.backup = false -- バックアップファイルを作らない
opt.swapfile = false -- スワップファイルを作らない
opt.undofile = true -- アンドゥ履歴をファイルに保存する
opt.undolevels = 10000 -- アンドゥ履歴の最大ステップ数
opt.autowrite = true -- バッファを離れるときに自動保存する
opt.autoread = true -- ファイルが外部で変更されたら自動で再読込する
opt.hidden = true -- 未保存バッファを隠せるようにする
opt.updatetime = 200 -- swap 保存・CursorHold イベントの発火間隔 (ms)。LSP diagnostics の表示速度に影響する
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" } -- :mksession で保存する対象

-- ===== UI =====

opt.number = true -- 行番号を表示する
opt.cursorline = true -- カーソル行をハイライトする
opt.laststatus = 3 -- ステータスラインをグローバル表示にする
opt.title = true -- タイトルバーにファイル名を表示する
opt.signcolumn = "yes" -- サインカラムを常時表示する (git diff・diagnostics アイコン列)
opt.pumblend = 10 -- 補完ポップアップの透明度
opt.pumheight = 10 -- 補完ポップアップの最大表示件数
opt.showmode = false -- モード表示を非表示にする (lualine 等で代替)
opt.ruler = false -- デフォルトのルーラーを非表示にする (statusline で代替)
opt.smoothscroll = true -- スムーズスクロールを有効にする
opt.winminwidth = 5 -- ウィンドウの最小幅
opt.wrap = false -- 長い行の折り返しを無効にする
opt.conceallevel = 2 -- Markdown の **bold** 等の修飾記号を非表示にする
opt.fillchars = { -- 特殊文字の表示形式
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

-- ===== 動作 =====

opt.showcmd = true -- 入力中のコマンドをステータスラインに表示する
opt.confirm = true -- 未保存バッファを閉じるとき確認ダイアログを出す
opt.inccommand = "nosplit" -- 置換をリアルタイムでインラインプレビューする
opt.jumpoptions = "view" -- ジャンプ時にスクロール位置も復元する
opt.timeoutlen = 300 -- キーマップのタイムアウト時間 (ms)
opt.virtualedit = "block" -- ビジュアルブロックモードでテキストのない位置にもカーソルを移動できる
opt.wildmode = "longest:full,full" -- コマンドライン補完の動作モード
opt.completeopt = "menu,menuone,noselect" -- 補完メニューの動作 (自動選択しない)
opt.wrapscan = true -- 検索が末尾に達したら先頭に折り返す
opt.mouse = "a" -- 全モードでマウス操作を有効にする
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus" -- SSH 接続時はクリップボード同期を無効にする
opt.shortmess:append({ W = true, I = true, c = true, C = true }) -- 各種メッセージを抑制する (I: スプラッシュ非表示)

-- ===== インデント =====

opt.expandtab = true -- Tab をスペースに展開する
opt.tabstop = 2 -- Tab 幅 (スペース数)
opt.shiftwidth = 2 -- インデント幅 (スペース数)
opt.shiftround = true -- インデントを shiftwidth の倍数に丸める
opt.smartindent = true -- 構文に応じてインデントを自動調整する
opt.formatoptions = "jcroqlnt" -- 自動整形のルール (コメント継続・長行の自動改行等)

-- ===== 検索 =====

opt.ignorecase = true -- 検索時に大文字小文字を区別しない
opt.smartcase = true -- 大文字を含む場合は大文字小文字を区別する
opt.incsearch = true -- 入力中にリアルタイムで検索結果を表示する
opt.hlsearch = true -- 検索結果をハイライトする
opt.showmatch = true -- 対応する括弧をハイライトする
opt.grepprg = "rg --vimgrep" -- :grep コマンドを ripgrep に差し替える
opt.grepformat = "%f:%l:%c:%m" -- rg --vimgrep の出力フォーマットに合わせたパース設定

-- ===== 折り畳み =====

opt.foldlevel = 99 -- 起動時に全折り畳みを展開した状態にする
opt.foldmethod = "indent" -- インデントベースで折り畳みを定義する
opt.foldtext = "" -- 折り畳み行のテキストを非表示にする

-- ===== スクロール =====

opt.scrolloff = 4 -- カーソル上下に常時表示するコンテキスト行数
opt.sidescrolloff = 8 -- カーソル左右に常時表示するコンテキスト列数

-- ===== ウィンドウ分割 =====

opt.splitbelow = true -- 水平分割時に新ウィンドウを下に開く
opt.splitright = true -- 垂直分割時に新ウィンドウを右に開く
opt.splitkeep = "screen" -- 分割時にスクロール位置を維持する

-- ===== その他 =====

opt.spelllang = { "en" } -- スペルチェックの対象言語
vim.g.markdown_recommended_style = 0 -- 組み込みの Markdown インデント設定を無効にする (tabstop 等が上書きされるのを防ぐ)
