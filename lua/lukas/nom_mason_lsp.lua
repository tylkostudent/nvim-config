local gdscript_config = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {},
}
if vim.fn.has("win32") == 1 then
    -- Windows specific. Requires nmap installed (`winget install nmap`)
    gdscript_config["cmd"] = { "ncat", "localhost", os.getenv("GDScript_Port") or "6005" }
elseif vim.fn.has("wls") then
    local cmd = { "godot-wsl-lsp" }
    local pipe = "/tmp/godot.pipe"

    vim.lsp.start({
        name = "Godot",
        cmd = cmd,
        filetypes = { "gdscript" },
        root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, {
            upward = true,
            path = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
        })[1]),
        on_attach = function(client, bufnr)
            vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
        end
    })
end

require("lspconfig").gdscript.setup(gdscript_config)
