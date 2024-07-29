local auto = vim.api.nvim_create_autocmd({
  "BufEnter"   
},
{
  pattern = {"*.tex"},
  command = "set filetype=tex"
})
