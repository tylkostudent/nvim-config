return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      window = {
        mappings = {
          ["T"] = function(state)
            local node = state.tree:get_node()
            local absolute = node:get_id()
            local relative = vim.fn.fnamemodify(absolute, ":.")
            local name = vim.fn.fnamemodify(absolute, ":t")

            local choices = {
              { label = "Absolute path", value = absolute },
              { label = "Relative path", value = relative },
              { label = "Name only", value = name },
            }

            vim.ui.select(choices, {
              prompt = "Copy which path?",
              format_item = function(item) return item.label end,
            }, function(choice)
              if choice then
                vim.fn.setreg("+", choice.value)
                vim.notify("Copied: " .. choice.value)
              end
            end)
          end,
        },
      }
    })
  end
}
