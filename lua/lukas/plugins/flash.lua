return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  -- stylua: ignore
  keys = {
    { "<leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "<leader>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "<leader>R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },

  opts = {
    modes = {
      search = {
        enabled = true,
      },
    },
  },

  config = true,

  init = function()
    vim.schedule(function()
      vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#ffffff", bg = "#ff0000", bold = true })
    end)
  end,
}
