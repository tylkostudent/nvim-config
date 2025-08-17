local get_visual_selection = function()
  vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg('v')
    vim.fn.setreg('v', {})
    text = string.gsub(text, "\n", "")
    if #text > 0 then
      return text
    else
      return ""
    end
end

local setup = function()
  local actions = require("telescope.actions")
  require('telescope').setup{
    defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
      file_ignore_patterns = { "%.gd%.uid$" },
      mappings = {
        i = {
          ["<C-h>"] = "which_key",
          ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-v>"] = actions.file_vsplit,
        },
        n = {
        },
      }
    },
    pickers = {
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({})
      },
    },
  }
  pcall(require("telescope").load_extension("ui-select"))

  -- keymaps
  local telescope = require("telescope.builtin")

  vim.keymap.set('n', '<leader>sf', telescope.find_files, { desc = 'Telescope [s]earch [f]iles' })
  vim.keymap.set('n', '<leader>sg', telescope.live_grep, { desc = 'Telescope [s]earch [g]rep' })
  vim.keymap.set('n', '<leader>sb', telescope.buffers, { desc = 'Telescope [s]earch [b]buffers' })
  vim.keymap.set('n', '<leader>ht', telescope.help_tags, { desc = 'Telescope [H]elp [T]ags' })
  vim.keymap.set('n', 'gd', telescope.lsp_definitions, { desc = '[G]oto [D]efinition' })
  vim.keymap.set('n', 'gr', telescope.lsp_references, { desc = '[G]oto [R]eferences' })
  vim.keymap.set('n', 'gI', telescope.lsp_implementations, { desc = '[G]oto [I]mplementation' })
  vim.keymap.set('n', '<leader>D', telescope.lsp_type_definitions, { desc = 'Type [D]efinition' })
  vim.keymap.set('n', '<leader>ds', telescope.lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
  vim.keymap.set('n', '<leader>ws', telescope.lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
  vim.keymap.set('n', '<leader>/', telescope.current_buffer_fuzzy_find, { desc = 'serch current buffer' })
  vim.keymap.set("n", "<leader>sw", function()
      telescope.grep_string({ search = vim.fn.expand("<cword>") })
  end, { desc = "Search word under cursor with Telescope" })
  vim.keymap.set("n", "<leader>fq", telescope.quickfix, { desc = "fuzzy find throught current quickfix list" })

  -- Godot scripts
  vim.keymap.set("n", "<leader>fs", function()
      telescope.find_files({ search_file = "*.gd" })
  end, { desc = "" })

  -- Visual mode
  vim.keymap.set("v", "<leader>sc", function()
      local text = get_visual_selection()
      telescope.current_buffer_fuzzy_find({ default_text = text })
  end, { desc = "[s]earch [c]urrent buffer" })

  vim.keymap.set("v", "<leader>sa", function()
      local text = get_visual_selection()
      telescope.grep_string({ search = text })
  end, { desc = "[s]earch [a]ll buffers" })

  -- Harpoon with Telescope
  vim.keymap.set("n", "mf", "<cmd>Telescope harpoon marks<CR>", { desc = "[s]how [m]arked files by harpoon" })

  vim.keymap.set("n", "<leader>sw",
    function()
      require("telescope.builtin").grep_string({
        search = vim.fn.expand("<cword>"),
      })
    end,
    { desc = "Search word under cursor with Telescope" }
  )
  vim.keymap.set('v', '<leader>sc',
    function ()
      local text = get_visual_selection()
      require('telescope.builtin').current_buffer_fuzzy_find({default_text = text})
    end,
    {desc = '[s]earch [c]urrent buffer'}
  )

  vim.keymap.set('v', '<leader>sa',
    function ()
      local text = get_visual_selection()
      require('telescope.builtin').grep_string({ search = text})
    end,
    {desc = '[s]earch [a]ll buffers'}
  )

  vim.keymap.set("n", "<leader>fq", require"telescope.builtin".quickfix, {desc = "fuzzy find throught current quickfix list"})

end


return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ThePrimeagen/harpoon',
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    setup()
  end
}


