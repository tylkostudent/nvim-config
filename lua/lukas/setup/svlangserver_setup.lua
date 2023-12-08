local nvim_lsp = require('lspconfig')

nvim_lsp.svlangserver.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name

    if path == '/path/to/project1' then
      client.config.settings.systemverilog = {
        includeIndexing     = {"**/*.{sv,svh,v}"},
        excludeIndexing     = {"test/**/*.sv*"},
        defines             = {},
        launchConfiguration = "/tools/verilator -sv -Wall --lint-only",
        formatCommand       = "/tools/verible-verilog-format"
      }
    elseif path == '/path/to/project2' then
      client.config.settings.systemverilog = {
        includeIndexing     = {"**/*.{sv,svh,v}"},
        excludeIndexing     = {"sim/**/*.sv*"},
        defines             = {},
        launchConfiguration = "/tools/verilator -sv -Wall --lint-only",
        formatCommand       = "/tools/verible-verilog-format"
      }
    end

    client.notify("workspace/didChangeConfiguration")
    return true
  end
}
