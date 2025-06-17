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
          capabilities = capabilities
        })
      end
    end
  },
}
