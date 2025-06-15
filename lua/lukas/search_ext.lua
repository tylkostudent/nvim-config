
local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.3)
  local height = opts.height or 1
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf = vim.api.nvim_create_buf(false, true) -- [listed=false, scratch=true]

  -- Set scratch behavior (important!)
  vim.bo[buf].buftype = 'prompt'
  vim.bo[buf].bufhidden = 'wipe'     -- Wipe buffer when hidden
  vim.bo[buf].swapfile = false       -- No swap file
  vim.bo[buf].filetype = ''          -- No filetype

  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)
  return { buf = buf, win = win }
end

M = {}

M.prompt_for_extension = function ()
  local ui = create_floating_window({ width = 40 })
  local buf = ui.buf
  local win = ui.win

  -- Prompt setup
  vim.fn.prompt_setprompt(buf, 'Extension: ')
  vim.fn.prompt_setcallback(buf, function(input)
    vim.api.nvim_win_close(win, true)
    if input and input ~= "" then
      require("lukas.functions_defs").search_ext_with_telescope(input)
    end
  end)

  -- Start insert mode
  vim.cmd("startinsert")
end

return M
