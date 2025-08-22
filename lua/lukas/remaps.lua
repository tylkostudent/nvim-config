-- ===========================
-- Basic Navigation & Splits
-- ===========================
vim.keymap.set('n', '<leader>ex', '<cmd>Ex<CR>', { desc = 'Open netrw explorer' })
vim.keymap.set('n', '<leader>hs', '<cmd>split<CR>', { desc = 'Horizontal split' })
vim.keymap.set('n', '<leader>vs', '<cmd>vs<CR>', { desc = 'Vertical split' })

-- Window resizing
vim.keymap.set('n', '<C-w>>', '<C-w>5>', { desc = 'Resize window wider' })
vim.keymap.set('n', '<C-w><', '<C-w>5<', { desc = 'Resize window narrower' })
vim.keymap.set('n', '<C-w>-', '<C-w>5-', { desc = 'Resize window shorter' })
vim.keymap.set('n', '<C-w>+', '<C-w>5+', { desc = 'Resize window taller' })

-- Tab navigation
vim.keymap.set('n', ']t', '<cmd>tabNext<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '[t', '<cmd>tabprevious<CR>', { desc = 'Go to previous tab' })

-- ===========================
-- Editing Enhancements
-- ===========================
-- Elixir pipe in insert mode
vim.keymap.set('i', '<A-p>', '|>', { desc = 'Elixir pipe operator' })

-- Go to end of line with `-`
vim.keymap.set({ 'n', 'v', 'o' }, '-', '$', { desc = 'Map - to end of line' })

-- Insert empty lines
vim.keymap.set('n', '<leader>o', 'o<esc>', { desc = 'Insert line below without leaving normal mode' })
vim.keymap.set('n', '<leader>O', 'O<esc>', { desc = 'Insert line above without leaving normal mode' })

-- Deleting without yanking
vim.keymap.set({ 'n', 'v' }, 'D', '"_d', { desc = 'Delete without yanking' })
vim.keymap.set({ 'n', 'v' }, 'ds', 'dd', { desc = 'Delete line (shortcut)' })

-- Surround word/selection with characters
local surrounds = {
  ["'"] = "''",
  ['"'] = '""',
  ['('] = '()',
  [')'] = '()',
  ['['] = '[]',
  [']'] = '[]',
  ['{'] = '{}',
  ['}'] = '{}',
}
for key, val in pairs(surrounds) do
  vim.keymap.set('n', '<leader>a'..key, 'ciw'..val..'<ESC>hpl', { desc = 'Surround word with '..val })
  vim.keymap.set('v', '<leader>a'..key, 'c'..val..'<ESC>hp', { desc = 'Surround selection with '..val })
end

-- ===========================
-- Language-specific Shortcuts
-- ===========================
-- Golang error snippet
vim.keymap.set('n', '<leader>pe', 'oif err != nil {\n}<ESC>ko', { desc = 'Insert Go if err != nil {}' })

-- SystemVerilog module template
vim.keymap.set('n', '<leader>pm', 'omodule#(\n\n)(\n\n);\nendmodule<ESC>kkkkkFea',
  { desc = 'Insert SystemVerilog module template' })

-- Begin-end block in SystemVerilog in insert mode
vim.keymap.set('i', '<C-b>', 'begin\n\nend<ESC>ki', { desc = 'Insert begin/end block' })

-- ===========================
-- Diagnostics & LSP
-- ===========================
vim.keymap.set('n', ']e', function() vim.diagnostic.jump({count = 1, float = true}) end, { desc = 'Next diagnostic' })
vim.keymap.set('n', '[e', function() vim.diagnostic.jump({count = -1, float = true}) end, { desc = 'Previous diagnostic' })

local isLspDiagnosticsVisible = true
vim.keymap.set('n', '<leader>lx', function()
  isLspDiagnosticsVisible = not isLspDiagnosticsVisible
  vim.diagnostic.config({
    virtual_text = isLspDiagnosticsVisible,
    underline = isLspDiagnosticsVisible
  })
end, { desc = 'Toggle diagnostics visibility' })

vim.keymap.set('n', '<leader>lo', '<cmd>copen<CR>', { desc = 'Open quickfix list' })
vim.keymap.set('n', '<leader>lc', '<cmd>cclose<CR>', { desc = 'Close quickfix list' })
vim.keymap.set('n', ']q', '<cmd>cnext<CR>', { desc = 'Next quickfix item' })
vim.keymap.set('n', '[q', '<cmd>cprevious<CR>', { desc = 'Previous quickfix item' })
vim.keymap.set('n', '<leader>ln', '<cmd>cnewer<CR>', { desc = 'Newer quickfix list' })
vim.keymap.set('n', '<leader>lp', '<cmd>colder<CR>', { desc = 'Older quickfix list' })

-- LSP-specific mappings
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame symbol' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature documentation' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = 'Add workspace folder' })
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'Remove workspace folder' })
vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover({ border = 'rounded' })
end, { desc = 'Hover documentation' })

-- ===========================
-- Telescope / Git / Tree
-- ===========================
vim.keymap.set('n', '<leader>rw', ":%s/\\<<C-r>=expand('<cword>')<CR>\\>/",
  { desc = 'Replace word under cursor' })
vim.keymap.set('n', '<leader>rW', ":%s/\\<<C-r>=expand('<cWORD>')<CR>\\>/",
  { desc = 'Replace WORD under cursor' })

vim.keymap.set('n', '<leader>gw',
  function()
    require('telescope').extensions.git_worktree.git_worktrees()
  end,
  { desc = 'Git worktrees list'}
)

vim.keymap.set('n', '<leader>gW', function()
    require('telescope').extensions.git_worktree.create_git_worktree()
  end,
  { desc = 'Create Git worktree' }
)

vim.keymap.set('n', '<leader>tw', '<cmd>Telescope workspaces<CR>', { desc = 'Telescope workspaces' })

-- Neotree
vim.keymap.set('n', '<leader>tt', '<cmd>Neotree toggle position=right<CR>', { desc = 'Toggle Neotree' })
vim.keymap.set('n', '<leader>tf', '<cmd>Neotree focus<CR>', { desc = 'Focus Neotree' })
vim.keymap.set('n', '<leader>tc', '<cmd>Neotree close<CR>', { desc = 'Close Neotree' })

-- ===========================
-- Floating Terminal
-- ===========================
vim.keymap.set('n', '<leader>ft', '<cmd>Floaterminal<CR>', { desc = 'Toggle floating terminal' })

-- ===========================
-- Markdown bullet list toggle
-- ===========================
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown' },
  callback = function()
    vim.keymap.set('n', '<C-l>', function()
      local line = vim.api.nvim_get_current_line()
      if line:match('^%- %[ %]') then
        vim.api.nvim_set_current_line(line:gsub('^%- %[ %]', '- [x]', 1))
      elseif line:match('^%- %[x%]') then
        vim.api.nvim_set_current_line(line:gsub('^%- %[x%]', '- [ ]', 1))
      else
        vim.api.nvim_set_current_line('- [ ] ' .. line)
      end
    end, { buffer = true, desc = 'Toggle bullet list in markdown' })
  end,
})
