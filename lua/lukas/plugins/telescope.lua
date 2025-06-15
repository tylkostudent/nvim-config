local setup = function()
  local actions = require("telescope.actions")
  require('telescope').setup{
    defaults = {
      file_ignore_patterns = { "%.gd%.uid$" }, 
      mappings = {
        i = {
          ["<C-h>"] = "which_key",
          ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
        },
        n = {
        },
      }
    },
    pickers = {
    },
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      },
    },
  }
end


return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    { 
      'nvim-telescope/telescope-fzf-native.nvim', 
      build = 'make',
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  config = function()
    setup()
  end
}
