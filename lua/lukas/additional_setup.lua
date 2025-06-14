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
require("nightfox").setup({
  options = {
    transparent = true,
  }
})
vim.cmd("colorscheme duskfox")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
