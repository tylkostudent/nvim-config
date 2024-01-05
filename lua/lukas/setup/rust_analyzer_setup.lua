require("lspconfig").rust_analyzer.setup{
  capabilities = capabilities,
  on_attach = on_attach,

  cmd = {
    "rustup", "run", "stable", "rust_analyzer",
  }
}
