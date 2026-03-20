return {
  "folke/noice.nvim",
  lazy = false,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        top_down = false,
      },
    },
  },
  opts = {},
}
