vim.g.mapleader = ' '
require("lukas.options")
require("lukas.remaps")
require("lukas.lazy")
require("lukas.plugin_remaps")
require("lukas.floaterminal")
require("lukas.gogot_lsp")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "single", -- or "double", "rounded", "solid", "shadow"
  }
)
