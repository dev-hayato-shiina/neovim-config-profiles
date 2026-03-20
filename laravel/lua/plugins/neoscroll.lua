return {
  "karb94/neoscroll.nvim",
  lazy = false,
  config = function()
    require("neoscroll").setup({
      respect_scrolloff = true,
    })
  end,
}
