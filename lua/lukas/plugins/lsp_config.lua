local auto_servers = {
  "basedpyright",
}

local servers = {
  "lua_ls",
  "basedpyright",
  -- add other servers here (not auto-installed)
}

return {
  "mason-org/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = auto_servers,
    })
  end,
  dependencies = {
    {
      "mason-org/mason.nvim",
      config = function()
        require("mason").setup()
      end,
    },
    {
      "neovim/nvim-lspconfig",
      dependencies = { "folke/neodev.nvim" },
      config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        for _, server in ipairs(servers) do
          lspconfig[server].setup({
            capabilities = capabilities,
          })
        end
      end,
    },
  },
}
