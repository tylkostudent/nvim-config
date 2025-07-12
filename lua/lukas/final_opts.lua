vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf

    if not client then
      return
    end

    -- Stop any duplicate clients (same name, different ID, same buffer)
    for _, other in ipairs(vim.lsp.get_active_clients({ bufnr = bufnr })) do
      if other.name == client.name and other.id ~= client.id then
        other.stop()
      end
    end

    -- Enable inlay hints if supported
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end,
})
vim.o.splitright = true
