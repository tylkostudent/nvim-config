local gdscript_config = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = on_attach,
    settings = {},
}
if vim.fn.has("win32") == 1 then
    -- Windows specific. Requires nmap installed (`winget install nmap`)
    gdscript_config["cmd"] = { "ncat", "localhost", os.getenv("GDScript_Port") or "6005" }
end

--for godot external editor capabilieties
if vim.fn.filereadable(vim.fn.getcwd() .. "/project.godot") == 1 then
    local addr = "./godot.pipe"
    if vim.fn.has "win32" == 1 then
        addr = "127.0.0.1:6004"
    end
    vim.fn.serverstart(addr)
end

require("lspconfig").gdscript.setup(gdscript_config)
