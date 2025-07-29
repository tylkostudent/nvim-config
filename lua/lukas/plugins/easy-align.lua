return{
  "junegunn/vim-easy-align",
  config = function ()
    -- Visual mode mapping: Start EasyAlign interactively (e.g., vipga)
    vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', { noremap = false })

    -- Normal mode mapping: Start EasyAlign on a motion or text object (e.g., gaip)
    vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', { noremap = false })
  end
}
