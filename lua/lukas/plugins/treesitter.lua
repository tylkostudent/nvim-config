return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = function ()
    require("nvim-treesitter.configs").setup({
      -- Only install the parsers you care about, excluding LaTeX
      ensure_installed = {
        "c", "cpp", "lua", "python", "rust", -- your preferred languages
        -- Do NOT include "latex"
      },
      auto_install = false, -- disable auto_install to avoid pulling in LaTeX
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end
}
