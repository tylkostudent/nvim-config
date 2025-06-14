require("rose-pine").setup({
  styles = {
    italic = false,
    bold = true,
    transparency = true,
  }
})
vim.cmd("colorscheme rose-pine")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
