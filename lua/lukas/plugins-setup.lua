-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()
-- true if packer was just installed
-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
  if not status then
    return
  end

  -- add list of plugins to install
  return packer.startup(function(use)
  
  -- packer can manage itself
  use("wbthomason/packer.nvim")
  -- my plugins
  use("nvim-lua/plenary.nvim")

  use("kyazdani42/nvim-web-devicons")

  --nvim tree
  use {
  'nvim-tree/nvim-tree.lua',
    requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  --status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

    
  --colors 
  use("bluz71/vim-nightfly-guicolors")
  
  --fuzzy finder 
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make"})
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x"}) 
  
  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  use("neovim/nvim-lspconfig")
  
  if packer_bootstrap then
    require("packer").sync()
  end

end)
