--require("lukas.plugins.lsp")
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn. system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ configure plugins ]]
-- note: here is where you install your plugins.
--  you can configure plugins using the `config` key.
--
--  you can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  require("lukas.plugins.telescope"),
  require("lukas.plugins.better_quickfix"),
  require("lukas.plugins.colorscheme"),
  'jdhao/better-escape.vim',
  'nvim-lua/plenary.nvim', -- " don't forget to add this one if you don't have it yet!
  'tpope/vim-sleuth',
  'junegunn/fzf',
  "nvim-lua/plenary.nvim",
  'NMAC427/guess-indent.nvim',
  "junegunn/vim-easy-align",
  require("lukas.plugins.harpoon"),
  require("lukas.plugins.neotree"),
  require("lukas.plugins.treesitter"),
  require("lukas.plugins.lsp_config"),
  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {}, -- required, even if empty
  },
  require("lukas.plugins.autocomplete"),
  require("lukas.plugins.lualine"),
  require("lukas.plugins.autopairs"),
  require("lukas.plugins.which_key"),
  require("lukas.plugins.tmux"),
  require("lukas.plugins.verilog_auto_inst"),
  require("lukas.plugins.lazydev"),
  require("lukas.plugins.indent"),
  'junegunn/vim-easy-align',
  require("lukas.plugins.rust"),
  "sindrets/diffview.nvim",
  "darrikonn/vim-gofmt",
  "tpope/vim-fugitive",
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  require("lukas.plugins.indent-guides"),
})
