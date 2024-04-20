require("lukas.plugins.obsidian").setup(
  config = {
    workspaces = {
      {
        name = "buf-parent",
        path = function()
          return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
        end,
      },
    }
  }
)
