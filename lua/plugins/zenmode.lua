return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  config = function()
    require("zen-mode").setup({
      plugins = {
        twilight = { enabled = true },
      },
    })
  end,
}
