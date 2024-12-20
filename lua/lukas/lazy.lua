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
  -- note: first, some plugins that don't require any configuration
  -- git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  -- detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  --rust
  'simrat39/rust-tools.nvim',
  -- note: this is where your plugins related to lsp can be installed.
  --  the configuration is done below. search for lspconfig to find it below.
  'michaeljsmith/vim-indent-object',
  require("lukas.plugins.lsp"),
  require("lukas.plugins.autocompletion"),
  require("lukas.plugins.git"),
  -- useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  require("lukas.plugins.color_scheme"),
  require("lukas.plugins.indent"),
  require("lukas.plugins.lualine"),
  -- "gc" to comment visual regions/lines
  { 'numtostr/comment.nvim', opts = {} },
  require("lukas.plugins.telescope"),
  -- fuzzy finder (files, lsp, etc)
  require("lukas.plugins.treesitter"),
  --"InES-HPMM/zhaw-snippets",
  require("lukas.plugins.verilog_module_instance"),
  'morganp/vim-SystemVerilogUVM.vim',
  require("lukas.plugins.tmux_vim"),
  'nvim-lua/plenary.nvim', -- " don't forget to add this one if you don't have it yet!
  'ThePrimeagen/harpoon',
  require("lukas.plugins.obsidian"),
  require("lukas.plugins.markdown_preview"),
  require("lukas.plugins.quickfix"),
  require("lukas.plugins.bookmarks"),
  require("lukas.plugins.latex"),
  'junegunn/vim-easy-align',
  'nat-418/tcl.nvim',
  'ziglang/zig.vim',
  require("lukas.plugins.neotree"),
  'echasnovski/mini.icons',
  "sindrets/diffview.nvim",
  'ThePrimeagen/git-worktree.nvim',
  'junegunn/fzf',
}, {})

