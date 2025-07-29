vim.keymap.set("n", "<leader>ex", "<cmd>:Ex<CR>")
vim.keymap.set('n', '<leader>hs', '<cmd>:split<CR>')
vim.keymap.set('n', '<leader>vs', '<cmd>:vs<CR>')

vim.keymap.set('i', '<A-p>', '|>', {desc = "elixir pipe operator"})
vim.keymap.set('n', '<leader>ex', '<cmd>:Ex<CR>')

--vim.keymap.set('n', 'q+', '<C-w>+')
--vim.keymap.set('n', 'q-', '<C-w>-')
vim.keymap.set({'n'}, '-', '$')
vim.keymap.set({'v'}, '-', '$')
vim.keymap.set('o', '-', '$', {desc = 'remap end line in oprator mode to /"-/"'})
vim.keymap.set('n', '<leader>o', 'o<esc>',{desc = 'make new line under without leaving normal mode'})
vim.keymap.set('n', '<leader>O', 'O<esc>',{desc = 'make new line under without leaving normal mode'})
vim.keymap.set({"n", "v"}, 'D', '"_d')
vim.keymap.set({"n", "v"}, 'ds', 'dd')
vim.keymap.set('n', '<C-w>>', '<C-w>5>')

vim.keymap.set('n', '<C-w><', '<C-w>5<')
vim.keymap.set('n', '<C-w>-', '<C-w>5-')
vim.keymap.set('n', '<C-w>+', '<C-w>5+')

vim.keymap.set('n', '<leader>a\'', 'ciw\'\'<ESC>hpl')
vim.keymap.set('n', '<leader>a\"', 'ciw\"\"<ESC>hpl')
vim.keymap.set('n', '<leader>a(', 'ciw()<ESC>hpl')
vim.keymap.set('n', '<leader>a)', 'ciw()<ESC>hpl')
vim.keymap.set('n', '<leader>a[', 'ciw[]<ESC>hpl')
vim.keymap.set('n', '<leader>a]', 'ciw[]<ESC>hpl')
vim.keymap.set('n', '<leader>a{', 'ciw{}<ESC>hpl')
vim.keymap.set('n', '<leader>a}', 'ciw{}<ESC>hpl')

--golang err
vim.keymap.set("n", "<leader>pe", "oif err != nil {\n}<ESC>ko" ,{desc = "paste line below golang if err!=nil{}"})
--init module system verilog
vim.keymap.set("n", "<leader>pm", "omodule#(\n\n)(\n\n);\nendmodule<ESC>kkkkkFea")
vim.keymap.set({"i"}, "<C-b>", "begin\n\nend<ESC>ki")

vim.keymap.set('v', '<leader>a\'', 'c\'\'<ESC>hp')
vim.keymap.set('v', '<leader>a\"', 'c\"\"<ESC>hp')
vim.keymap.set('v', '<leader>a(', 'c()<ESC>hp')
vim.keymap.set('v', '<leader>a)', 'c()<ESC>hp')
vim.keymap.set('v', '<leader>a[', 'c[]<ESC>hp')
vim.keymap.set('v', '<leader>a]', 'c[]<ESC>hp')
vim.keymap.set('v', '<leader>a{', 'c{}<ESC>hp')
vim.keymap.set('v', '<leader>a}', 'c{}<ESC>hp')

--"to surround" 
vim.keymap.set('n', "]e", function()
  vim.diagnostic.goto_next()
end, {desc = "goto prev diagnostic"})
vim.keymap.set('n', "[e", function()
  vim.diagnostic.goto_prev()
end, {desc = "goto prev diagnostic"})

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
    })
end)
vim.keymap.set('n', '<leader>lo', '<cmd>:copen<CR>')
vim.keymap.set('n', '<leader>lc', '<cmd>:cclose<CR>')
vim.keymap.set('n', ']q', '<cmd>:cnext<CR>')
vim.keymap.set('n', '[q', '<cmd>:cprevious<CR>')
vim.keymap.set('n', '<leader>ln', '<cmd>:cnewer<CR>')
vim.keymap.set('n', '<leader>lp', '<cmd>:colder<CR>')

vim.keymap.set('n', '<leader>tt', '<cmd>:Neotree toggle position=right<CR>')
vim.keymap.set('n', '<leader>tf', '<cmd>:Neotree focus<CR>')
vim.keymap.set('n', '<leader>tc', '<cmd>:Neotree close<CR>')
--vim.keymap.set({'i', 'n'}, "<C-s>", require("telescope."))
--
vim.keymap.set('n', '<leader>rw', ":%s/\\<<c-r>=expand(\"<cword>\")<cr>\\>/", {desc = "[r]eplace [w]ord under cursor"})
vim.keymap.set('n', '<leader>rW', ":%s/\\<<c-r>=expand(\"<cWORD>\")<cr>\\>/", {desc = "[r]eplace [W]ORD under cursor"})

vim.keymap.set(
  'n', "<leader>gw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
  {desc = "[g]it [w]orktrees list"}
)

vim.keymap.set(
  'n', "<leader>gW", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
  {desc = "[g]it [W]orktree create"}
)



vim.keymap.set("n", "]t", "<cmd>:tabNext<CR>", {desc = "go to next tab"})
vim.keymap.set("n", "[t", "<cmd>:tabprevious<CR>", {desc = "go to previous tab"})

--floating terminal
vim.keymap.set("n", "<leader>ft", "<cmd>:Floaterminal<CR>", {desc = "tobble persistent floating termianal"})
--
-- vim.keymap.set("i", "\"", "\"\"<left>")
-- vim.keymap.set("i", "(", "()<left>")
-- vim.keymap.set("i", "{", "{}<left>")

vim.keymap.set("n", "<leader>tw", "<cmd>:Telescope workspaces<CR>")

--markdown bullet list
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },  -- correct filetype
  callback = function()
    vim.keymap.set("n", "<C-l>", function()
      local line = vim.api.nvim_get_current_line()

      if line:match("^%- %[ %]") then
        -- Toggle unchecked → checked
        local new_line = line:gsub("^%- %[ %]", "- [x]", 1)
        vim.api.nvim_set_current_line(new_line)
      elseif line:match("^%- %[x%]") then
        -- Toggle checked → unchecked
        local new_line = line:gsub("^%- %[x%]", "- [ ]", 1)
        vim.api.nvim_set_current_line(new_line)
      else
        vim.api.nvim_set_current_line("- [ ] " .. line)
      end
    end, { buffer = true, desc = "Toggle bullet list in markdown" })
  end,
})

local function get_comment_prefix()
  local cs = vim.bo.commentstring
  if not cs or cs == "" then return "//" end  -- fallback

  -- extract prefix before the %s
  local prefix = cs:match("^(.-)%%s")
  if prefix then
    return prefix:gsub("%s+$", "")  -- remove trailing space
  else
    return cs  -- fallback to raw commentstring
  end
end

local function insert_block(start_tag, end_tag)
  local comment = get_comment_prefix()
  local row = vim.api.nvim_win_get_cursor(0)[1]

  local lines = {
    comment .. "!" .. start_tag,
    comment .. "!" .. end_tag,
  }

  vim.api.nvim_buf_set_lines(0, row, row, false, lines)
  -- Move cursor to the line between the tags
  vim.api.nvim_win_set_cursor(0, { row + 1, #lines[1] })
end

vim.keymap.set("n", "<leader>db", function()
  insert_block("DOC", "ENDDOC")
end, { desc = "Insert DOC block" })

vim.keymap.set("n", "<leader>de", function()
  insert_block("EXACT", "ENDEXACT")
end, { desc = "Insert EXACT block" })

--lsp remaps
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder' })
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = '[W]orkspace [R]emove Folder' })


vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover({ border = "rounded" })
end, { desc = "lsp hower action" })
