return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")

    vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "ファイル検索" })
    vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "文字列検索" })
    vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "バッファ一覧" })
    vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "ヘルプ検索" })
    vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "最近開いたファイル" })
    vim.keymap.set("n", "<leader>fc", fzf.commands, { desc = "コマンド一覧" })
  end,
}
