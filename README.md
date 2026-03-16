# neovim-config-profiles

## ディレクトリ構成

```
.
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
│           ├── barbar.lua
│           ├── coding.lua # Laravel専用にカスタマイズ
│           ├── fcitx5.lua
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
│           ├── smear-cursor.lua
│           └── tokyonight.lua
├── .gitignore
├── README.md
├── init.lua # デフォルト設定
├── lazy-lock.json
└── lua
    ├── config
    │   ├── autocmd.lua
    │   ├── base.lua
    │   ├── keymap.lua
    │   ├── lazy.lua
    │   └── option.lua
    └── plugins
        ├── alpha-nvim.lua
        ├── barbar.lua
        ├── coding.lua
        ├── fcitx5.lua
        ├── gitsigns.lua
        ├── hop.lua
        ├── indent-blankline.lua
        ├── lazydocker.lua
        ├── lazygit.lua
        ├── lualine.lua
        ├── markview.lua
        ├── multicursor.lua
        ├── neo-tree.lua
        ├── neoscroll.lua
        ├── noice.lua
        ├── smear-cursor.lua
        └── tokyonight.lua
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
