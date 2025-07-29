return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config

    opts = {},
    config = function ()
        require("ibl").setup {
            enabled = false,
            indent = {
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
