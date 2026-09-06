return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        -- Define the two highlight groups
        vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#8A8A8A", nocombine = true })
        vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = "#6A6A6A", nocombine = true })

        -- ibl cycles through this list per indent level (level 1 -> level 2 -> ...)
        -- Repeat the dim group enough times to cover any realistic nesting depth
        local highlight = { "IndentBlanklineIndent1" }
        for _ = 1, 40 do
            table.insert(highlight, "IndentBlanklineIndent2")
        end

        require("ibl").setup({
            indent = {
                char = "│",
                highlight = highlight,
            },
            whitespace = {
                highlight = { "Whitespace", "NonText" },
            },
            scope = {
                enabled = false,
            },
        })

        -- vim.api.nvim_create_autocmd("Filetype", {
        --     pattern = { "gdscript", "python" },
        --     command = "IBLEnable",
        -- })
    end,
}
