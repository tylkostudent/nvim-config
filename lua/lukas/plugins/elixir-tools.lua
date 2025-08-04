return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

    elixir.setup {
      nextls = {
        enable = false,
      },

      elixirls = {
        enable = true,
        cmd = is_windows and { "D:\\Programy\\LS\\elixir-ls-v0.28.0\\language_server.bat" } or nil,
        settings = elixirls.settings {
          dialyzerEnabled = false,
          enableTestLenses = false,
        },
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
        end,
      },

      projectionist = {
        enable = true,
      },
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
