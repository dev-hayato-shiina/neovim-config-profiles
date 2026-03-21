return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "lua_ls" },
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.lsp.config("lua_ls", { capabilities = capabilities })

      vim.lsp.config("intelephense", {
        capabilities = capabilities,
        settings = {
          intelephense = {
            telemetry = { enabled = false },
            files = {
              maxSize = 1000000,
              exclude = {
                "**/.git/**",
                "**/node_modules/**",
                "**/vendor/**/{Tests,tests}/**",
                "**/vendor/fakerphp/**",
              },
            },
          },
        },
      })

      vim.lsp.enable({ "lua_ls", "intelephense" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        -- Lua - LSP
        -- "lua-language-server",
        -- Lua - Formatter
        "stylua",

        -- PHP - LSP
        "intelephense",
        -- PHP - Formatter
        "pint",
        -- PHP - Linter
        "phpstan",
        -- PHP - DAP
        "php-debug-adapter",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    lazy = false,
    event = "BufWritePre",
    opts = {
      formatters = {
        mago = {
          command = "mago",
          args = { "format", "--stdin-input" },
          stdin = true,
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        php = { "mago" },
      },
      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters.mago = {
        cmd = "mago",
        stdin = false,
        args = { "lint" },
        append_fname = true,
        stream = "stdout",
        ignore_exitcode = true,
        parser = function(output)
          local diagnostics = {}
          local severity_map = {
            error = vim.diagnostic.severity.ERROR,
            warning = vim.diagnostic.severity.WARN,
            note = vim.diagnostic.severity.HINT,
          }

          local current = nil
          for line in output:gmatch("[^\n]+") do
            local sev, rule, msg = line:match("^(error|warning|note)%[([^%]]+)%]: (.+)")
            if sev then
              current = {
                severity = severity_map[sev] or vim.diagnostic.severity.WARN,
                message = msg .. "  [" .. rule .. "]",
              }
            elseif current then
              local row, col = line:match("%-%->[^:]+:(%d+):(%d+)")
              if row then
                table.insert(diagnostics, {
                  lnum = tonumber(row) - 1,
                  col = tonumber(col) - 1,
                  severity = current.severity,
                  message = current.message,
                  source = "mago",
                })
                current = nil
              end
            end
          end

          return diagnostics
        end,
      }

      lint.linters_by_ft = {
        php = { "mago" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = { handlers = {} },
      },
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function()
          local dap = require("dap")
          local dapui = require("dapui")

          dapui.setup()

          dap.listeners.after.event_initialized["dapui_config"] = dapui.open
          dap.listeners.before.event_terminated["dapui_config"] = dapui.close
          dap.listeners.before.event_exited["dapui_config"] = dapui.close
        end,
      },
    },
    config = function()
      local dap = require("dap")
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    opts = {
      ensure_installed = { "lua", "php" },
      highlight = { enable = true },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    },
  },
  {
    "Saghen/blink.cmp",
    lazy = false,
    version = "1.*",
    dependencies = { "L3MON4D3/LuaSnip" },
    opts = {
      completion = {
        menu = {
          border = "rounded",
        },
        documentation = {
          window = {
            border = "rounded",
          },
        },
      },
      signature = {
        window = {
          border = "rounded",
        },
      },
      fuzzy = { implementation = "lua" },
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
      },
    },
  },
}
