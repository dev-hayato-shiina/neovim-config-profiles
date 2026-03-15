return {
  "jake-stewart/multicursor.nvim",
  lazy = false,
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set
    local hl = vim.api.nvim_set_hl

    -- カーソルのハイライト設定（ピンク系）
    hl(0, "MultiCursorCursor", { fg = "#1e1e2e", bg = "#f38ba8", bold = true })
    hl(0, "MultiCursorVisual", { fg = "#1e1e2e", bg = "#f38ba8" })
    hl(0, "MultiCursorSign", { fg = "#f38ba8" })
    hl(0, "MultiCursorDisabledCursor", { fg = "#1e1e2e", bg = "#f38ba8" })
    hl(0, "MultiCursorDisabledVisual", { fg = "#1e1e2e", bg = "#cba6f7" })

    -- ColorScheme が変わっても上書きされないように再適用
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        hl(0, "MultiCursorCursor", { fg = "#1e1e2e", bg = "#f38ba8", bold = true })
        hl(0, "MultiCursorVisual", { fg = "#1e1e2e", bg = "#f38ba8" })
        hl(0, "MultiCursorSign", { fg = "#f38ba8" })
        hl(0, "MultiCursorDisabledCursor", { fg = "#1e1e2e", bg = "#f38ba8" })
        hl(0, "MultiCursorDisabledVisual", { fg = "#1e1e2e", bg = "#cba6f7" })
      end,
    })

    -- 空行をスキップしてカーソルを追加
    local function lineAddCursorSkipEmpty(dir)
      local last = vim.fn.line("$")
      local target = vim.fn.line(".") + dir
      while target >= 1 and target <= last do
        if vim.fn.getline(target):match("%S") then
          mc.lineAddCursor(dir)
          return
        end
        target = target + dir
      end
    end

    -- Ctrl+Alt+Up/Down でカーソル追加（空行スキップ）
    set({ "n", "x" }, "<c-a-Up>", function()
      lineAddCursorSkipEmpty(-1)
    end)
    set({ "n", "x" }, "<c-a-Down>", function()
      lineAddCursorSkipEmpty(1)
    end)

    -- 中クリックで非連続カーソル追加
    set({ "n", "x" }, "<middlemouse>", mc.handleMouse)

    -- ESC2回でマルチカーソル解除
    set({ "n", "x" }, "<Esc><Esc>", function()
      mc.clearCursors()
    end)
  end,
  opts = {},
}
