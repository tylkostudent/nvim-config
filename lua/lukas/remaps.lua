vim.g.maplocalleader = ' '
vim.g.mapleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<Leader>tt', '<cmd>:Neotree toggle=true<CR>', {desc = 'toggle Neotree'})
vim.keymap.set('n', '<Leader>tf', '<cmd>:Neotree focus<CR>', {desc = 'focus on Neotree'})
--split remaps
vim.keymap.set('n', 'q', '<C-w>', {desc = 'remap window mode'})
--vim.keymap.set('n', 'ql', '<C-w>l', {desc = 'remap switching splits'})
--vim.keymap.set('n', 'qk', '<C-w>k', {desc = 'remap switching splits'})
--vim.keymap.set('n', 'qj', '<C-w>j', {desc = 'remap switching splits'})
--vim.keymap.set('n', 'qh', '<C-w>h', {desc = 'remap switching splits'})
vim.keymap.set('n', '<Leader>vs', '<cmd>:vs<CR>')
vim.keymap.set('n', '<Leader>hs', '<cmd>:split<CR>')
--vim.keymap.set('n', 'q+', '<C-w>+')
--vim.keymap.set('n', 'q-', '<C-w>-')
vim.keymap.set({'n'}, '-', '$')
vim.keymap.set({'v'}, '-', '$')
--lua snip
local luasnip = require("luasnip")
vim.keymap.set("i", "<C-k>", function() luasnip.expand() end, {silent = true} )
vim.keymap.set({"i", "s"}, "<C-l>", function() luasnip.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-j>", function() luasnip.jump(-1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-e>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end, {silent = true})
vim.keymap.set('o', '-', '$', {desc = 'remap end line in oprator mode to /"_/"'})
vim.keymap.set('n', '<leader>o', 'o<esc>',{desc = 'make new line under without leaving normal mode'})
vim.keymap.set('n', '<leader>O', 'O<esc>',{desc = 'make new line under without leaving normal mode'})
--nnoremap <leader>o o<esc>0"_d
--nnoremap <leader>o o<esc>0"_d
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- you can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'search [g]it [f]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[s]earch [f]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[s]earch [h]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[s]earch current [w]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[s]earch by [g]rep' })
vim.keymap.set('n', '<leader>sG', ':livegrepgitroot<cr>', { desc = '[s]earch by [g]rep on git root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[s]earch [d]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[s]earch [r]esume' })

-- [[ configure treesitter ]]
-- see `:help nvim-treesitter`
-- defer treesitter setup after first render to improve startup time of 'nvim {filename}'

