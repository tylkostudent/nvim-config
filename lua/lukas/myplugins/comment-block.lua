-- Command to insert a filetype-aware comment block
local insert_comment_block = function()
  local commentstring = vim.bo.commentstring or "# %s"
  local prefix = commentstring:match("^(.-)%%s") or "#"
  prefix = prefix:gsub("%s+$", "") -- remove trailing space

  local width = 80
  local line = string.rep(prefix, math.floor(width / #prefix))

  local row = vim.api.nvim_win_get_cursor(0)[1] - 1
  vim.api.nvim_buf_set_lines(0, row, row, false, {
    line,
    prefix .. " ",
    line,
  })

  -- Move cursor to comment line and start insert after the prefix + space
  vim.api.nvim_win_set_cursor(0, { row + 2, #prefix + 2 })
  vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>cs", insert_comment_block, {desc = "Insert comment separator"})
