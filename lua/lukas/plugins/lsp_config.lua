local lsp_servers = {
  "lua_ls",
  "rust_analyzer",
  "gopls",
  "svlangserver",
  "pyright",
  "pylsp",
}

return {
  -- mason
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = lsp_servers,
        automatic_installation = true,
        automatic_enable = {
          exclude = {
            "gopls"
          },
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {'folke/neodev.nvim',},
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      for _, server in ipairs(lsp_servers) do
        lspconfig[server].setup({
          on_attach = function ()
            local bufnr = vim.api.nvim_get_current_buf()
            local clients = vim.lsp.get_clients({ bufnr = bufnr })
            local seen = {}

            for _, client in ipairs(clients) do
              if seen[client.name] then
                -- duplicate found, stop this client
                print("Stopping duplicate LSP client:", client.name, client.id)
                client.stop()
              else
                -- first client of this name, mark as seen
                seen[client.name] = true
              end
            end
          end,
          capabilities = capabilities
        })
      end
    end
  },
}
