require("rose-pine").setup({
  styles = {
    italic = false,
    bold = true,
    transparency = false,
  }
})
require("kanagawa").setup({
  styles = {
    italic = false,
    bold = true,
    transparency = false,
  }
})
vim.cmd("colorscheme nightfly")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
