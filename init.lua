vim.g.mapleader = ' '
require("lukas.lazy")
require("lukas.setup")
require("lukas.options")
require("lukas.remaps")
require("lukas.additional_setup")
vim.cmd([[:TSEnable highlight<CR>]])
vim.diagnostic.config({
	severity_sort = true,
	underline = {severity = vim.diagnostic.severity.ERROR},
	virtual_text = {severity = vim.diagnostic.severity.ERROR},
})
require("lukas.autocommands")
