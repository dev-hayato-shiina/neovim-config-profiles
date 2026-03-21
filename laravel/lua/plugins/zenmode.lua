return {
  "folke/zen-mode.nvim",
  event = "VeryLazy",
  cmd = "ZenMode",
  keys = { { "<leader>zm", "<cmd>ZenMode<cr>", mode = "n" } },
  config = function()
    require("zen-mode").setup({
      plugins = {
        twilight = { enabled = true },
      },
    })
  end,
}
