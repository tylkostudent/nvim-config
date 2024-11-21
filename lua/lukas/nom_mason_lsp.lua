local gdscript_config = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {},
}
if vim.fn.has("win32") == 1 then
    -- Windows specific. Requires nmap installed (`winget install nmap`)
    gdscript_config["cmd"] = { "ncat", "localhost", os.getenv("GDScript_Port") or "6005" }
elseif vim.fn.has("linux" == 1) then
    local lspconfig = require("lspconfig")
    lspconfig.gdscript.setup({
       cmd = { "godot-wsl-lsp", "--useMirroredNetworking" }
    })
end

require("lspconfig").gdscript.setup(gdscript_config)
