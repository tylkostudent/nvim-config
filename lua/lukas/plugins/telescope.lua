local setup = function()
  local actions = require("telescope.actions")
  require('telescope').setup{
    defaults = {
      file_ignore_patterns = { "%.gd%.uid$" },
      mappings = {
        i = {
          ["<C-h>"] = "which_key",
          ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-v>"] = actions.file_vsplit,
        },
        n = {
        },
      }
    },
    pickers = {
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({})
      },
    },
  }
  pcall(require("telescope").load_extension("ui-select"))
end


return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-ui-select.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = "make",
      config = function()
        pcall(require("telescope").load_extension, "fzf")
      end,
    },
  },
  config = function()
    setup()
  end
}
