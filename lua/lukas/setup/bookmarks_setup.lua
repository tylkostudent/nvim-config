require('bookmarks').setup {
  -- sign_priority = 8,  --set bookmark sign priority to cover other sign
  save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
  keywords =  {
    ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
    ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
    ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
    ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
  },
  on_attach = function(bufnr)
    local bm = require "bookmarks"
    local map = vim.keymap.set
    map("n","<leader>bt",bm.bookmark_toggle, {desc = "Add [b]ookmark [t]oogle"}) -- add or remove bookmark at current line
    map("n","<leader>ba",bm.bookmark_ann, {desc = "[b]ookmark [a]nnotate"}) -- add or edit mark annotation at current line
    map("n","<leader>bc",bm.bookmark_clean, {desc = "[b]ookmark [c]lean"}) -- clean all marks in local buffer
    map("n","<leader>bn",bm.bookmark_next, {desc = "[b]ookmark [n]ext"}) -- jump to next mark in local buffer
    map("n","<leader>bp",bm.bookmark_prev, {desc = "[b]ookmark [p]revious"}) -- jump to previous mark in local buffer
    map("n","<leader>bl",bm.bookmark_list, {desc = "[b]ookmark [l]ist"}) -- show marked file list in quickfix window
    map("n","<leader>bx",bm.bookmark_clear_all, {desc = "[b]ookmark clean all"}) -- removes all bookmarks
  end
}
require('telescope').load_extension('bookmarks')
