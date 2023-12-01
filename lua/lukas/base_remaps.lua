vim.g.mapleader = ' '
vim.opt.shiftwidth = 4
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '9', '0')
vim.keymap.set('n', '0', '$')
vim.keymap.set('n', '<Leader>o', 'o<ESC>',{desc = 'make new line under without leaving normal mode'})
--nnoremap <Leader>o o<Esc>0"_D
--nnoremap <Leader>O O<Esc>0"_D
