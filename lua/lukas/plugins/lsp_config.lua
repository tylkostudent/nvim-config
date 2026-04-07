local auto_servers = {
  "basedpyright",
  "lua_ls"
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
      lazy = true,
      dependencies = { "folke/neodev.nvim" },
    },
  },
}
