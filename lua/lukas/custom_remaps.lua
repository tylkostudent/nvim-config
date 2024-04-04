vim.keymap.set('n', '<Leader>hs', '<cmd>:split<CR>')
vim.keymap.set('n', '<Leader>vs', '<cmd>:vs<CR>')

vim.keymap.set('i', "<A-]>", "<esc>")
vim.keymap.set('i', "<A-[>", "<esc>")

--vim.keymap.set('n', 'q+', '<C-w>+')
--vim.keymap.set('n', 'q-', '<C-w>-')
vim.keymap.set({'n'}, '-', '$')
vim.keymap.set({'v'}, '-', '$')
vim.keymap.set('o', '-', '$', {desc = 'remap end line in oprator mode to /"-/"'})
vim.keymap.set('n', '<leader>o', 'o<esc>',{desc = 'make new line under without leaving normal mode'})
vim.keymap.set('n', '<leader>O', 'O<esc>',{desc = 'make new line under without leaving normal mode'})
vim.keymap.set('v', '<leader>sc', function ()
  local text = require("lukas.custom_functions").get_visual_selection()
  require"telescope.builtin".grep_string({default_text = text})
end
, {desc = '[s]earch [c]urrent buffer'})
vim.keymap.set('v', '<leader>sa', function ()
  local text = require("lukas.custom_functions").get_visual_selection()
  require('telescope.builtin').live_grep({ default_text = text })
end, {desc = '[s]earch [a]ll buffers'})
vim.keymap.set("n", '<leader>cw', "<cmd>:SearchReplaceSingleBufferCWORD<CR>", {desc = '[r]eplace [w]ord'})
vim.keymap.set("n", '<leader>cW', "<cmd>:SearchReplaceMultiBufferCWORD<CR>", {desc = '[r]eplace [w]ord in all buffers'})
vim.keymap.set("n", '<leader>aw', "<cmd>:SearchReplaceSingleBufferCWORD<CR>", {desc = '[r]eplace [w]ord'})
vim.keymap.set("n", '<leader>aW', "<cmd>:SearchReplaceMultiBufferCWORD<CR>", {desc = '[r]eplace [w]ord in all buffers'})
vim.keymap.set({"n", "v"}, 'D', '"_d')
vim.keymap.set({"n", "v"}, 'ds', 'dd')
vim.keymap.set({"n", "v"}, 'Ds', '"_dd')
vim.keymap.set('n', '<C-w>>', '<C-w>5>')

vim.keymap.set('n', '<C-w><', '<C-w>5<')
vim.keymap.set('n', '<C-w>-', '<C-w>5-')
vim.keymap.set('n', '<C-w>+', '<C-w>5+')

vim.keymap.set('n', '<leader>a\'', 'diwi\'\'<ESC>hp')
vim.keymap.set('n', '<leader>a\"', 'diwi\"\"<ESC>hp')
vim.keymap.set('n', '<leader>a(', 'diwi()<ESC>hp')
vim.keymap.set('n', '<leader>a)', 'diwi()<ESC>hp')
vim.keymap.set('n', '<leader>a[', 'diwi[]<ESC>hp')
vim.keymap.set('n', '<leader>a]', 'diwi[]<ESC>hp')
vim.keymap.set('n', '<leader>a{', 'diwi{}<ESC>hp')
vim.keymap.set('n', '<leader>a}', 'diwi{}<ESC>hp')


vim.keymap.set('v', '<leader>a\'', 'd<ESC>i\'\'<ESC>hp')
vim.keymap.set('v', '<leader>a\"', 'd<ESC>i\"\"<ESC>hp')
vim.keymap.set('v', '<leader>a(', 'd<ESC>i()<ESC>p')
vim.keymap.set('v', '<leader>a)', 'd<ESC>i()<ESC>p')
vim.keymap.set('v', '<leader>a[', 'd<ESC>i[]<ESC>p')
vim.keymap.set('v', '<leader>a]', 'd<ESC>i[]<ESC>p')
vim.keymap.set('v', '<leader>a{', 'd<ESC>i{}<ESC>p')
vim.keymap.set('v', '<leader>a}', 'd<ESC>i{}<ESC>p')

vim.keymap.set('n', "]e", function()
  vim.diagnostic.goto_next()
end, {desc = "goto prev diagnostic"})
vim.keymap.set('n', "[e", function()
  vim.diagnostic.goto_prev()
end, {desc = "goto prev diagnostic"})

vim.keymap.set('n', 'dio', 'di(')
vim.keymap.set('n', 'Dio', '"_di(')
vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
--escaping terminal 
vim.cmd([[
  :noremap <A-h> <C-\><C-N><C-w>h
  :noremap <A-j> <C-\><C-N><C-w>j
  :noremap <A-k> <C-\><C-N><C-w>k
  :noremap <A-l> <C-\><C-N><C-w>l
  :noremap <A-h> <C-\><C-N><C-w>h
  :noremap <A-j> <C-\><C-N><C-w>j
  :noremap <A-k> <C-\><C-N><C-w>k
  :noremap <A-l> <C-\><C-N><C-w>l
  :nnoremap <A-h> <C-w>h
  :nnoremap <A-j> <C-w>j
  :nnoremap <A-k> <C-w>k
  :nnoremap <A-l> <C-w>l
]])
-- Disable ESLint LSP server and hide virtual text in Neovim
-- Add this to your init.lua or init.vim file
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    }) end)
