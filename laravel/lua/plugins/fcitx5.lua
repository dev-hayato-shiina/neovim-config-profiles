return {
  "pysan3/fcitx5.nvim",
  lazy = false,
  cond = vim.fn.executable("fcitx5-remote") == 1,
  event = { "ModeChanged" },
  opts = {
    imname = {
      norm = "keyboard-jp",
      ins = "keyboard-jp",
      cmd = "keyboard-jp",
    },
    remember_prior = false,
  },
}
