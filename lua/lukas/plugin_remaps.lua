--telescope remaps

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope [s]earch [f]iles' })
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
vim.keymap.set("n", "<leader>/", require("telescope.builtin").current_buffer_fuzzy_find, {desc = "serch current buffer"})
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {desc = 'Signature Documentation'})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {desc = '[G]oto [D]eclaration'})
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, {desc = '[W]orkspace [A]dd Folder'})
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, {desc = '[W]orkspace [R]emove Folder'})
vim.keymap.set("n", "K", function ()
    vim.lsp.buf.hover({border = "rounded"})
  end,
  {desc = "lsp hower action"}
)


vim.keymap.set("n", "<leader>sw", 
  function()
    require("telescope.builtin").grep_string({ 
      search = vim.fn.expand("<cword>"),
      word_match = "-w",
    })
  end, 
  { desc = "Search word under cursor with Telescope" }
)

vim.keymap.set(
  'v', '<leader>sc', 
  function ()
    local text = require("lukas.functions_defs").get_visual_selection()
    require('telescope.builtin').current_buffer_fuzzy_find({default_text = text, word_match = "-w"})
  end,
  {desc = '[s]earch [c]urrent buffer'}
)

vim.keymap.set('v', '<leader>sa', 
  function ()
    local text = require("lukas.functions_defs").get_visual_selection()
    require('telescope.builtin').grep_string({ search = text, word_match = "-w" })
  end, 
  {desc = '[s]earch [a]ll buffers'}
)

-- Fuzzy find godot scripts
vim.keymap.set(
  'n', "<leader>fs", function()
	  require("telescope.builtin").find_files{search_file = "*.gd"}
  end,
  {desc = ""}
)

vim.keymap.set("n", "<leader>fq", require"telescope.builtin".quickfix, {desc = "fuzzy find throught current quickfix list"})

vim.keymap.set("n", "ma", require("harpoon.mark").add_file, {desc= "[h]arpoon [a]dd file"})
vim.keymap.set("n", "ms", require("harpoon.ui").toggle_quick_menu, {desc= "[h]arpoon [s]how files"})
vim.keymap.set("n", "<leader>sm", "<cmd>Telescope harpoon marks<CR>", {desc= "[s]how [m]arked files by harpoon"})
vim.keymap.set("n", "mn", require("harpoon.ui").nav_next, {desc= "[h]arpoon [n]ext file"})
vim.keymap.set("n", "mp", require("harpoon.ui").nav_prev, {desc= "[h]arpoon [p]rev file"})

--search extension mine code but requires telescope
vim.keymap.set("n", "<leader>se", require("lukas.search_ext").prompt_for_extension, {desc = "[s]each files with [e]xtension"})


-- Visual mode mapping: Start EasyAlign interactively (e.g., vipga)
vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', { noremap = false })

-- Normal mode mapping: Start EasyAlign on a motion or text object (e.g., gaip)
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', { noremap = false })

