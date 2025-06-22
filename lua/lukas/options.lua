-- [[ setting options ]]
-- see `:help vim.o`
-- note: you can change these options as you wish!


-- set highlight on search
vim.o.hlsearch = false
vim.api.nvim_set_option("clipboard","unnamed")
-- make line numbers default
vim.wo.number = true

-- enable mouse mode
vim.o.mouse = 'a'
vim.g.have_nerd_font=true
-- sync clipboard between os and neovim.
--  remove this option if you want your os clipboard to remain independent.
--  see `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'
vim.o.shiftwidth = 4

-- enable break indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- case-insensitive searching unless \c or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- note: you should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ basic keymaps ]]

-- keymaps for better default experience
-- see `:help vim.keymap.set()`



-- [[ highlight on yank ]]
-- see `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('yankhighlight', { clear = true })
vim.api.nvim_create_autocmd('textyankpost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
vim.opt.tabstop = 4 -- A TAB character looks like 4 spaces
vim.opt.shiftwidth = 4 -- Number of spaces inserted when indenting
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
vim.cmd("set colorcolumn=80");
vim.cmd("set relativenumber");
vim.cmd("set scrolloff=3")
vim.cmd("set cursorline")
vim.diagnostic.config({
  severity_sort = true,
  underline = {severity = vim.diagnostic.severity.ERROR},
  virtual_text = {severity = vim.diagnostic.severity.ERROR},
})
vim.g.zig_fmt_autosave = 0
