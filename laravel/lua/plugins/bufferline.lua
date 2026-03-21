return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = { { "<leader>w", "<cmd>BufferLinePickClose<cr>", mode = "n" } },
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
      },
    })
  end,
}
