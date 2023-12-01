return {
  -- theme inspired by atom
  'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
      vim.cmd.colorscheme 'onedark'
  end,
}
