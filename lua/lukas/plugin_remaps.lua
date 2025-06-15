--telescope remaps

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope [s]earch [f]iles' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope [s]earch [g]rep' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Telescope [s]earch [b]buffers' })
vim.keymap.set('n', '<leader>ht', builtin.help_tags, { desc = 'Telescope [H]elp [T]ags' })

--neotree remaps
vim.keymap.set('n', '<leader>tt', '<cmd>:Neotree toggle position=right<CR>')

--lsp remaps
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {desc = '[R]e[n]ame'})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {desc = '[C]ode [A]ction'})
vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, {desc = '[G]oto [D]efinition'})
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {desc = '[G]oto [R]eferences'})
vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, {desc = '[G]oto [I]mplementation'})
vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, {desc = 'Type [D]efinition'})
vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, {desc = '[D]ocument [S]ymbols'})
vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, {desc = '[W]orkspace [S]ymbols'})
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {desc = 'Signature Documentation'})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {desc = '[G]oto [D]eclaration'})
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, {desc = '[W]orkspace [A]dd Folder'})
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, {desc = '[W]orkspace [R]emove Folder'})

--my remaps that require plugins 

vim.keymap.set(
  'v', '<leader>sc', 
  function ()
    local text = require("lukas.custom_functions").get_visual_selection()
    require('telescope.builtin').current_buffer_fuzzy_find({default_text = text})
  end
  , {desc = '[s]earch [c]urrent buffer'}
)
vim.keymap.set('v', '<leader>sa', function ()
  local text = require("lukas.custom_functions").get_visual_selection()
  require('telescope.builtin').live_grep({ default_text = text })
end, {desc = '[s]earch [a]ll buffers'})

-- Fuzzy find godot scripts
vim.keymap.set(
  'n', "<leader>fs", function()
	  require("telescope.builtin").find_files{search_file = "*.gd"}
  end,
  {desc = ""}
)

vim.keymap.set("n", "<leader>fq", require"telescope.builtin".quickfix, {desc = "fuzzy find throught current quickfix list"})
