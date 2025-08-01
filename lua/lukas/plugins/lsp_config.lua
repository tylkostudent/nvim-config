local lsp_servers = {
  "lua_ls",
  "gopls",
  "svlangserver",
  "pyright",
  "pylsp",
  -- "rust_analyzer",
}


-- local elixirls_setup = function(capabilities)
--   local is_windows = vim.loop.os_uname().version:match("Windows")
--   local elixirls_cmd
--
--   if is_windows then
--     -- Use your explicit Windows path here:
--     elixirls_cmd = "D:/Programy/langserv/elixir-ls-v0.28.0/language_server.bat"
--   else
--     local elixirls_dir = vim.fn.stdpath("data") .. "/mason/packages/elixir-ls"
--     elixirls_cmd = elixirls_dir .. "/language_server.sh"
--   end
--
--   require("lspconfig").elixirls.setup({
--     capabilities = capabilities,
--     cmd = { elixirls_cmd },
--   })
-- end

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
            -- elixirls_setup(capabilities)
          elseif server == "rust_analyzer" then
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
