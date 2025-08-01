return {
  "ThePrimeagen/harpoon",
  config = function ()
    require("telescope").load_extension("harpoon")
    vim.keymap.set("n", "ma", require("harpoon.mark").add_file, { desc = "harpoon add current file" })
    vim.keymap.set("n", "ms", require("harpoon.ui").toggle_quick_menu, { desc = "harpoon [s]how files" })
    vim.keymap.set("n", "mn", require("harpoon.ui").nav_next, { desc = "harpoon next file" })
    vim.keymap.set("n", "mp", require("harpoon.ui").nav_prev, { desc = "harpoon prev file" })
    vim.keymap.set("n", "mf", "<cmd>Telescope harpoon marks<CR>", {desc= "show marked files by harpoon in telescope"})
    vim.keymap.set("n", "md", require("harpoon.mark").rm_file, {desc = "harpoon remove cuurent file"})
  end
}
