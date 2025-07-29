return {
  "ThePrimeagen/harpoon",
  config = function ()
    require("telescope").load_extension("harpoon")
    vim.keymap.set("n", "ma", require("harpoon.mark").add_file, { desc = "[h]arpoon [a]dd file" })
    vim.keymap.set("n", "ms", require("harpoon.ui").toggle_quick_menu, { desc = "[h]arpoon [s]how files" })
    vim.keymap.set("n", "mn", require("harpoon.ui").nav_next, { desc = "[h]arpoon [n]ext file" })
    vim.keymap.set("n", "mp", require("harpoon.ui").nav_prev, { desc = "[h]arpoon [p]rev file" })
    vim.keymap.set("n", "mf", "<cmd>Telescope harpoon marks<CR>", {desc= "[s]how [m]arked files by harpoon"})
  end
}
