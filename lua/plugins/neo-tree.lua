return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,           -- 隠しファイルを非表示にせず、通常ファイルと区別して表示する
        hide_dotfiles = false,    -- ドットファイル（.gitなど）を表示する
        hide_gitignored = false,  -- .gitignore に記載されたファイルも表示する
      },
    },
  },
}
