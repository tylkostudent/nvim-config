return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function ()
        require("ibl").setup {
            enabled = false,
            indent = {
                char = ">",
                highlight = nil,
            },
            whitespace = { highlight = { "Whitespace", "NonText" } },
            scope = {
                enabled = false,
            },
        }
        vim.api.nvim_create_autocmd("Filetype", {
            pattern = {"gdscript", "python"},
            command = "IBLEnable"
        })
    end
}
