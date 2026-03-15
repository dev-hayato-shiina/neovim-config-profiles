# neovim-config-profiles

## ディレクトリ構成

```
~/.config/nvim/
├── init.lua        # デフォルト設定
├── laravel/
│   └── init.lua
└── README.md
```

## プロファイルの切り替え

`NVIM_APPNAME` はネストしたディレクトリに対応していないため、シンボリックリンクで解決する

```sh
ln -s ~/.config/nvim/laravel ~/.config/nvim-laravel
```

## 起動

```sh
NVIM_APPNAME=nvim-laravel nvim .   # Laravel
nvim .                             # デフォルト
```
