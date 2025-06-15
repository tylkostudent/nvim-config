local setup = function()
  require("rose-pine").setup({
    styles = {
      italic = false,
      bold = true,
      transparency = true,
    }
  })
end

return { 
  "rose-pine/neovim", 
  name = "rose-pine", 
  config = function()
    setup()
    vim.cmd("colorscheme rose-pine")
  end
}


