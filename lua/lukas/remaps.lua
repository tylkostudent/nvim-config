vim.g.maplocalleader = ' '
vim.g.mapleader = ' '
--shift insert remaps
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
--split remaps
--vim.keymap.set('n', 'ql', '<C-w>l', {desc = 'remap switching splits'})
--vim.keymap.set('n', 'qk', '<C-w>k', {desc = 'remap switching splits'})
--vim.keymap.set('n', 'qj', '<C-w>j', {desc = 'remap switching splits'})
--vim.keymap.set('n', 'qh', '<C-w>h', {desc = 'remap switching splits'})
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

vim.keymap.set('n', '<leader>ga', require('telescope.builtin').git_commits, { desc = '[g]it [a]ll commits' })
vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches, { desc = '[g]it [b]ranches' })
vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_bcommits, { desc = '[git] branch [c]ommits' })
vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = '[git] branch [c]ommits' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files)

vim.keymap.set('n', '<leader>si', 
  function() 
    require('telescope.builtin').find_files({no_ignore = true})
  end, 
  { desc = '[s]earch [f]iles' }
)
 
vim.keymap.set('n', '<leader>ff', 
  function() 
    require('telescope.builtin').find_files({no_ignore = true, hidden = true}) 
  end, 
  { desc = '[s]earch [f]iles' }
)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[s]earch [h]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[s]earch current [w]ord' })
--[[vim.keypam.set("v", '<leader>rc', function ()
  local text = require("lukas.custom_functions").get_visual_selection()
  local cmd = ":%s/"+text+"//gc"
  vim.cmd(cmd)
end, {desc = '[r]eplace selection in [c]urrent buffer'})]]
vim.keymap.set('n', '<leader>sg', require('telescope').extensions.live_grep_args.live_grep_args, { desc = '[s]earch by [g]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[s]earch by [g]rep on git root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[s]earch [d]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[s]earch [r]esume' })

vim.keymap.set("n", "ma" ,"<cmd>lua require(\"harpoon.mark\").add_file()<CR>" ,{ desc = 'harpoon mark file' })
vim.keymap.set("n", "mn" ,"<cmd>lua require(\"harpoon.ui\").nav_next()<CR>" ,{ desc = 'harpoon mark file' })
vim.keymap.set("n", "mp" ,"<cmd>lua require(\"harpoon.ui\").nav_prev()<CR>" ,{ desc = 'harpoon mark file' })
vim.keymap.set("n", "mo" ,"<cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<CR>" ,{ desc = 'harpoon mark file' })
vim.keymap.set("n", "mr" ,"<cmd>lua require(\"harpoon.mark\").rm_file()<CR>" ,{ desc = 'harpoon mark file' })
vim.keymap.set("n", "mc" ,"<cmd>lua require(\"harpoon.mark\").clear_all()<CR>" ,{ desc = 'harpoon mark file' })
require("lukas.custom_remaps")
-- [[ configure treesitter ]]
-- see `:help nvim-treesitter`
-- defer treesitter setup after first render to improve startup time of 'nvim {filename}'

