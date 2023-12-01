--require("lukas.plugins.lsp")
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
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
  -- note: first, some plugins that don't require any configuration

  -- git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- note: this is where your plugins related to lsp can be installed.
  --  the configuration is done below. search for lspconfig to find it below.
  require("lukas.plugins.lsp"),
  require("lukas.plugins.neotree"),
  require("lukas.plugins.autocompletion"),
  require("lukas.plugins.git"),
  -- useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  require("lukas.plugins.color_scheme"),
  -- "gc" to comment visual regions/lines
  { 'numtostr/comment.nvim', opts = {} },
  require("lukas.plugins.telescope"),
  -- fuzzy finder (files, lsp, etc)
  require("lukas.plugins.treesitter"),

  -- note: next step on your neovim journey: add/configure additional "plugins" for kickstart
  --       these are some example plugins that i've included in the kickstart repository.
  --       uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- note: the import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    you can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --    uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --
  --    for additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  -- { import = 'custom.plugins' },
}, {})

