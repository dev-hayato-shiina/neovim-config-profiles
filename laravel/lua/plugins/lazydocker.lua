return {
  "mgierada/lazydocker.nvim",
  event = "BufRead",
  dependencies = { "akinsho/toggleterm.nvim" },
  config = function()
    require("lazydocker").setup({
      border = "curved",
      width = 0.9,
      height = 0.9,
    })
  end,
  keys = { { "<leader>ld", "<cmd>Lazydocker<cr>" } },
}
