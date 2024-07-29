local auto = vim.api.nvim_create_autocmd({
  "BufReadPre"   
},
{
  pattern = {"*.tex"},
  command = "set filetype=tex"
})
