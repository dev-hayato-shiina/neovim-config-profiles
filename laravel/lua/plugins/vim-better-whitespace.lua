return {
  "ntpeters/vim-better-whitespace",
  lazy = false,
  config = function()
    vim.g.better_whitespace_enabled = 1
    vim.g.strip_whitespace_on_save = 1
    vim.g.strip_whitespace_confirm = 0
  end,
}
