Func = {}
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

Func.get_visual_selection = function()
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


Func.search_ext = function(ext)
  local uv = vim.loop
  local cwd = vim.fn.getcwd()
  local files = {}

  local function scan_dir(dir)
    local handle = uv.fs_scandir(dir)
    if not handle then return end

    while true do
      local name, type = uv.fs_scandir_next(handle)
      if not name then break end

      local full_path = dir .. "/" .. name
      if type == "directory" then
        scan_dir(full_path)
      elseif type == "file" and name:match("%." .. ext .. "$") then
        local rel_path = full_path:sub(#cwd + 2) -- remove cwd + '/'
        table.insert(files, rel_path)
      end
    end
  end

  scan_dir(cwd)

  if #files == 0 then
    print("No files found with extension: " .. ext)
  end

  return files
end


Func.search_ext_with_telescope = function(ext)
  local files = Func.search_ext(ext)
  if #files == 0 then return end

  pickers.new({}, {
    prompt_title = "Files with ." .. ext .. " extension",
    finder = finders.new_table({
      results = files,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.cmd("edit " .. vim.fn.fnameescape(selection[1]))
      end)
      return true
    end,
  }):find()
end

return Func

