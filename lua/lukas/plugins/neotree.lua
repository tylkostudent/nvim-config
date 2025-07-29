return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    --neotree remaps
    vim.keymap.set('n', '<leader>tt', '<cmd>:Neotree toggle position=right<CR>')
    require("neo-tree").setup({
      window = {
        mappings = {
          ["I"] = function(state, selected_nodes)
            local Path = require("plenary.path")
            local cwd = vim.fn.getcwd()
            local git_dir = vim.fn.finddir(".git", cwd .. ";")
            if git_dir == "" then
              vim.notify("Not in a Git repository.", vim.log.levels.ERROR)
              return
            end

            local gitignore_path = cwd .. "/.gitignore"
            if not Path:new(gitignore_path):exists() then
              vim.notify(".gitignore not found in current directory.", vim.log.levels.ERROR)
              return
            end

            -- Collect nodes: either selected or current node
            local nodes = selected_nodes
            if not nodes or #nodes == 0 then
              local node = state.tree:get_node()
              if node then nodes = { node } end
            end
            if not nodes or #nodes == 0 then
              vim.notify("No file or directory selected.", vim.log.levels.WARN)
              return
            end

            -- Read existing .gitignore lines
            local lines = {}
            local exists = {}
            for _, line in ipairs(Path:new(gitignore_path):readlines()) do
              lines[#lines + 1] = line
              exists[line] = true
            end

            -- Add new entries
            local added = 0
            for _, node in ipairs(nodes) do
              local abs_path = node:get_id()
              local rel_path = vim.fn.fnamemodify(abs_path, ":.")
              rel_path = rel_path:gsub("\\", "/") -- Ensure forward slashes

              -- Optional: add trailing slash for directories
              if node.type == "directory" and not rel_path:match("/$") then
                rel_path = rel_path .. "/"
              end

              if not exists[rel_path] then
                lines[#lines + 1] = rel_path
                exists[rel_path] = true
                added = added + 1
              end
            end

            if added > 0 then
              Path:new(gitignore_path):write(table.concat(lines, "\n"), "w")
              vim.notify("Added " .. added .. " entr" .. (added == 1 and "y" or "ies") .. " to .gitignore")
            else
              vim.notify("All paths already present in .gitignore", vim.log.levels.INFO)
            end
          end,

          ["Y"] = function(state)
            local node = state.tree:get_node()
            local absolute = node:get_id()
            local relative = vim.fn.fnamemodify(absolute, ":.")
            relative = relative:gsub("\\", "/")
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
