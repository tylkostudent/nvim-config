require("rose-pine").setup({
  styles = {
    italic = false,
    bold = true,
    transparency = false,
  }
})
vim.cmd("colorscheme rose-pine")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
