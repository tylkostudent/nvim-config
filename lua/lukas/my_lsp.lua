  vim.lsp.start {
    name = "my_LSP",
    cmd = {"/home/lukas/Documents/dev/rust/lsp/target/debug/server"},
    capabilities = vim.lsp.protocol.make_client_capabilities(),
  }
