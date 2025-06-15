local setup = function()
  require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      },
      n = {
      },
    }
  },
  pickers = {
  },
  extensions = {
  }
  }
end

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    setup()
  end
}

