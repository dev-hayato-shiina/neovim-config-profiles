return {
  "crnvl96/lazydocker.nvim",
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>ld", "<cmd>LazyDocker<cr>", desc = "LazyDocker" },
  },
}
