local gdscript_config = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = on_attach,
    settings = {},
}

-- LSP command
if vim.fn.has("win32") == 1 then
    -- Windows: requires nmap/ncat
    gdscript_config.cmd = { "ncat", "localhost", os.getenv("GDScript_Port") or "6005" }
else
    -- Linux/macOS: just use netcat (nc) or direct TCP
    gdscript_config.cmd = { "nc", "localhost", os.getenv("GDScript_Port") or "6005" }
end

-- Godot external editor capabilities
if vim.fn.filereadable(vim.fn.getcwd() .. "/project.godot") == 1 then
    local addr
    if vim.fn.has("win32") == 1 then
        addr = "127.0.0.1:6004"
    else
        --[[ 
        in godot external editor flags are: 
        --server godot.pipe --remote-send "<C-\><C-N>:e {file}<CR>:call cursor({line}+1,{col})<CR>"
        ]]
        addr = "./godot.pipe"  -- Unix domain socket for Linux/macOS
    end
    vim.fn.serverstart(addr)
end

require("lspconfig").gdscript.setup(gdscript_config)
