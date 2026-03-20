return {
  "APZelos/blamer.nvim",
  lazy = false,
  config = function()
    vim.g.blamer_enabled = 1
    vim.g.blamer_delay = 100
    vim.g.blamer_show_in_visual_modes = 0
  end,
}
