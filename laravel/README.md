# コーディング周りの全プラグインと連携の構造

## LSP

- **nvim-lspconfig** - https://github.com/neovim/nvim-lspconfig
  - LSPサーバーの起動設定を提供するプラグイン
  - これがないとLSPサーバーをどう起動するか定義できない

- **mason.nvim** - https://github.com/williamboman/mason.nvim
  - LSPサーバー・DAP・Linter・Formatterのバイナリをインストール・管理するプラグイン

- **mason-lspconfig.nvim** - https://github.com/williamboman/mason-lspconfig.nvim
  - `mason.nvim` と `nvim-lspconfig` を繋ぐブリッジ
  - Masonでインストールしたサーバーを `nvim-lspconfig` に自動登録する

- **mason-tool-installer.nvim** - https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
  - `mason.nvim` で管理するツールを `ensure_installed` で一元管理するプラグイン
  - LSP・DAP・Linter・Formatterを含む全ツールの自動インストールを担う
  - `mason-lspconfig.nvim` の `ensure_installed` はLSPのみ対象のため、全ツールを統一管理するためにこちらを使う

```
mason.nvim ──(インストール)──> バイナリ
mason-tool-installer.nvim ──(ensure_installed)──> mason.nvim
mason-lspconfig.nvim ──(自動登録)──> nvim-lspconfig ──(起動)──> LSPサーバー
```

## Formatter

- **conform.nvim** - https://github.com/stevearc/conform.nvim
  - フォーマッターを呼び出して整形するプラグイン
  - フォーマッター本体 (`pint` / `stylua` / `prettier` 等) は `mason.nvim` で管理

## Linter

- **nvim-lint** - https://github.com/mfussenegger/nvim-lint
  - Linterを呼び出して問題を検出するプラグイン
  - 結果は `vim.diagnostic` API 経由でエディタ上に表示される

## Snippet

- **LuaSnip** - https://github.com/L3MON4D3/LuaSnip
  - スニペットを動かすエンジン
  - 展開・タブ移動・動的プレースホルダーの処理を担当

- **friendly-snippets** - https://github.com/rafamadriz/friendly-snippets
  - スニペットのデータ集
  - VSCode形式のJSONファイルが言語ごとに収録されている

## DAP

```
Neovim (nvim-dap) <--DAP--> 各言語のアダプター <---> 実行中のプロセス
```

- **nvim-dap** - https://github.com/mfussenegger/nvim-dap
  - DAPプロトコルでデバッガーと通信するエンジン

- **mason-nvim-dap.nvim** - https://github.com/jay-babu/mason-nvim-dap.nvim
  - `mason.nvim` と `nvim-dap` を繋ぐブリッジ
  - Masonでインストールしたアダプターを `nvim-dap` に自動登録する

- **xdebug** - https://github.com/xdebug/xdebug (PHP用アダプター)
  - ブレークポイントで実行を停止
  - ステップ実行 (`step over` / `step into` / `step out`)
  - 変数の中身を確認
  - コールスタックの確認
  - 条件付きブレークポイント

- **nvim-dap-ui** - https://github.com/rcarriga/nvim-dap-ui
  - nvim-dap の情報をウィンドウとして描画するUI層
  - 変数パネル (`local` / `global` / `closure`)
  - コールスタック
  - ブレークポイント一覧
  - ウォッチ式
  - REPLコンソール

## Syntax / テキストオブジェクト

- **nvim-treesitter** - https://github.com/nvim-treesitter/nvim-treesitter
  - AST（Abstract Syntax Tree）ベース（木構造）のパーサーをローカルで動かすプラグイン
  - シンタックスハイライト
  - インデント

- **nvim-treesitter-textobjects** - https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  - nvim-treesitterのASTを利用してテキストオブジェクトを提供するプラグイン
  - 関数・クラス・引数などをコード構造単位で選択・移動できる (`if` / `af` 等)

## 補完UI

- **blink.cmp** - https://github.com/Saghen/blink.cmp
  - 複数の補完ソースを束ねてポップアップ表示するプラグイン
  - LSP (型・メソッド補完)
  - LuaSnip (スニペット)
  - パス補完
  - バッファ内の単語

## 編集補助

- **nvim-autopairs** - https://github.com/windwp/nvim-autopairs
  - 括弧・クォートを自動で閉じるプラグイン

- **nvim-surround** - https://github.com/kylechui/nvim-surround
  - 括弧・クォート・タグを追加・変更・削除するプラグイン
  - `cs"'` で `"` を `'` に変換 / `ds"` で削除 / `ysiw"` で囲む

- **ts-comments.nvim** - https://github.com/folke/ts-comments.nvim
  - `gcc` で行コメント / `gc` でビジュアル選択範囲をコメントアウト
  - TreeSitterベースのため言語ごとに適切なコメント記法を自動選択

## ファイル検索 / Grep

- **fzf-lua** - https://github.com/ibhagwan/fzf-lua
  - ファイル検索・grep・バッファ・コマンド履歴などをfzfで検索するプラグイン

## テスト

- **neotest** - https://github.com/nvim-neotest/neotest
  - テストの実行・結果表示をNeovim上で行うフレームワーク
  - 言語ごとにアダプターを追加することで対応言語を拡張できる

- **neotest-phpunit** - https://github.com/olimorris/neotest-phpunit
  - PHPUnit用アダプター

- **neotest-pest** - https://github.com/V13Axel/neotest-pest
  - Pest用アダプター (Laravelでよく使われる)

## Git

- **gitsigns.nvim** - https://github.com/lewis6991/gitsigns.nvim
  - gutterへの差分表示・インラインblame・ハンクの操作を提供するプラグイン

# 機能とプラグインの対応表

| 機能 | LSP (built-in) | [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) | [conform.nvim](https://github.com/stevearc/conform.nvim) | [nvim-lint](https://github.com/mfussenegger/nvim-lint) | [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | [blink.cmp](https://github.com/Saghen/blink.cmp) | [nvim-dap](https://github.com/mfussenegger/nvim-dap) | [mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim) | [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | [nvim-surround](https://github.com/kylechui/nvim-surround) | [ts-comments.nvim](https://github.com/folke/ts-comments.nvim) | [fzf-lua](https://github.com/ibhagwan/fzf-lua) | [neotest](https://github.com/nvim-neotest/neotest) | [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | [mason.nvim](https://github.com/williamboman/mason.nvim) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| シンタックスハイライト | | | | | **yes** | | | | | | | | | | | | | | | |
| インデント | | | | | **yes** | | | | | | | | | | | | | | | |
| テキストオブジェクト | | | | | | **yes** | | | | | | | | | | | | | | |
| フォーマット | 一部 `*` | | | | | | **yes** | | | | | | | | | | | | | |
| Lint / 静的解析 | 一部 `**` | | | | | | | **yes** | | | | | | | | | | | | |
| diagnostics 表示 | **yes** | | | | | | | **yes** (経由) | | | | | | | | | | | | |
| 補完候補の提供 | **yes** | | | | | | | | **yes** (snippet) | | | | | | | | | | | |
| 補完UIの表示 | | | | | | | | | | **yes** | | | | | | | | | | |
| スニペット展開 | | | | | | | | | **yes** | | | | | | | | | | | |
| 定義ジャンプ | **yes** | | | | | | | | | | | | | | | | | | | |
| 参照ジャンプ | **yes** | | | | | | | | | | | | | | | | | | | |
| ホバードキュメント | **yes** | | | | | | | | | | | | | | | | | | | |
| シグネチャヘルプ | **yes** | | | | | | | | | | | | | | | | | | | |
| インレイヒント | **yes** | | | | | | | | | | | | | | | | | | | |
| rename | **yes** | | | | | | | | | | | | | | | | | | | |
| コードアクション | **yes** | | | | | | | | | | | | | | | | | | | |
| デバッグ通信 | | | | | | | | | | | **yes** | | | | | | | | | |
| デバッグUI表示 | | | | | | | | | | | | | **yes** | | | | | | | |
| LSPサーバー起動設定 | | **yes** | | | | | | | | | | | | | | | | | | |
| LSPサーバー自動登録 | | | **yes** | | | | | | | | | | | | | | | | | |
| DAPアダプター自動登録 | | | | | | | | | | | | **yes** | | | | | | | | |
| 括弧・クォート自動補完 | | | | | | | | | | | | | | **yes** | | | | | | |
| 括弧・クォート編集 | | | | | | | | | | | | | | | **yes** | | | | | |
| コメントアウト | | | | | | | | | | | | | | | | **yes** | | | | |
| ファイル検索 / grep | | | | | | | | | | | | | | | | | **yes** | | | |
| テスト実行 | | | | | | | | | | | | | | | | | | **yes** | | |
| Git差分 / blame | | | | | | | | | | | | | | | | | | | **yes** | |
| バイナリ管理 | | | | | | | | | | | | | | | | | | | | **yes** |
| ツール自動インストール | | | | **yes** | | | | | | | | | | | | | | | | |

`*` LSPサーバーがフォーマット機能を持つ場合 (`phpactor` 等)、`conform.nvim` なしでも動くが機能が限定的  
`**` LSPサーバーが診断を出す場合 (`intelephense` 等)、`nvim-lint` なしでも動くが `phpstan` 等の外部Linterは別途必要
