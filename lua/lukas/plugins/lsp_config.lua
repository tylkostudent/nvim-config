local lsp_servers = {
  "lua_ls",
  "rust_analyzer",
  "gopls",
  "svlangserver",
  "pyright",
  "pylsp",
  "elixirls"
}


local elixirls_setup = function(capabilities)
  local is_windows = vim.loop.os_uname().version:match("Windows")
  local elixirls_dir = vim.fn.stdpath("data") .. "/mason/packages/elixir-ls"
  local elixirls_cmd

  if is_windows then
    elixirls_cmd = elixirls_dir .. "/language_server.bat"
  else
    elixirls_cmd = elixirls_dir .. "/language_server.sh"
  end

  require("lspconfig").elixirls.setup({
    capabilities = capabilities,
    cmd = { elixirls_cmd },
  })
end

return {
  "mason-org/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = lsp_servers,
    })
  end,
  dependencies = {
    {
      "mason-org/mason.nvim",
      config = function()
        require("mason").setup()
      end
    },
    {
      "neovim/nvim-lspconfig",
      dependencies = {'folke/neodev.nvim',},
      config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")
        for _, server in ipairs(lsp_servers) do
          if server == "elixirls" then 
            elixirls_setup(capabilities)
          else
            lspconfig[server].setup({
              capabilities = capabilities
            })
          end
        end
      end
    },
  }
}
