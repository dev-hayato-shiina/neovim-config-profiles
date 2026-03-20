# neovim-config-profiles

## ディレクトリ構成

```
.
├── README.md
├── init.lua
├── laravel # Laravel専用
│   ├── README.md
│   ├── init.lua
│   ├── lazy-lock.json
│   └── lua
│       ├── config
│       │   ├── autocmd.lua
│       │   ├── base.lua
│       │   ├── keymap.lua
│       │   ├── lazy.lua
│       │   └── option.lua
│       └── plugins
│           ├── alpha-nvim.lua
│           ├── babel.lua
│           ├── blamer.lua
│           ├── bufferline.lua
│           ├── coding.lua # Laravel専用にカスタマイズ
│           ├── fcitx5.lua
│           ├── fzf-lua.lua
│           ├── git-messenger.lua
│           ├── gitsigns.lua
│           ├── hop.lua
│           ├── indent-blankline.lua
│           ├── lazydocker.lua
│           ├── lazygit.lua
│           ├── lualine.lua
│           ├── markview.lua
│           ├── multicursor.lua
│           ├── neo-tree.lua
│           ├── neoscroll.lua
│           ├── noice.lua
│           ├── onedark.lua
│           ├── project.lua
│           ├── trouble.lua
│           ├── twilight.lua
│           ├── vim-better-whitespace.lua
│           ├── which-key.lua
│           └── zenmode.lua
├── lazy-lock.json
├── lua # デフォルト設定
│   ├── config
│   │   ├── autocmd.lua
│   │   ├── base.lua
│   │   ├── keymap.lua
│   │   ├── lazy.lua
│   │   └── option.lua
│   └── plugins
│       ├── alpha-nvim.lua
│       ├── babel.lua
│       ├── blamer.lua
│       ├── bufferline.lua
│       ├── coding.lua
│       ├── fcitx5.lua
│       ├── fzf-lua.lua
│       ├── git-messenger.lua
│       ├── gitsigns.lua
│       ├── hop.lua
│       ├── indent-blankline.lu
│       ├── lazydocker.lua
│       ├── lazygit.lua
│       ├── lualine.lua
│       ├── markview.lua
│       ├── multicursor.lua
│       ├── neo-tree.lua
│       ├── neoscroll.lua
│       ├── noice.lua
│       ├── onedark.lua
│       ├── project.lua
│       ├── trouble.lua
│       ├── twilight.lua
│       ├── vim-better-whitespace.lua
│       ├── which-key.lua
│       └── zenmode.lua
└── stylua.toml
```

## プロファイルの切り替え

`NVIM_APPNAME` はネストしたディレクトリに対応していないため、シンボリックリンクで解決する

```sh
ln -s ~/.config/nvim/laravel ~/.config/nvim-laravel
```

## 起動

```sh
nvim                           # デフォルト
NVIM_APPNAME=nvim-laravel nvim # Laravel
```
