local function list_files_git()
  -- Returns both tracked and untracked (but not ignored) files
  local cmd = {
    "git",
    "ls-files",
    "--cached",       -- tracked files
    "--others",       -- untracked files
    "--exclude-standard"  -- respects .gitignore, .git/info/exclude, and core.excludesfile
  }

  local output = vim.fn.systemlist(cmd)

  -- Convert to absolute paths if you want, or keep relative
  return output
end

local function list_files(dir)
  local files = {}
  local scan = vim.loop.fs_scandir(dir)
  if not scan then return files end

  while true do
    local name, type = vim.loop.fs_scandir_next(scan)
    if not name then break end
    -- Skip .git directory
    if type == "directory" and name == ".git" then
      goto continue
    end

    local full_path = dir .. "/" .. name
    if type == "file" then
      table.insert(files, full_path)
    elseif type == "directory" then
      vim.list_extend(files, list_files(full_path))
    end

    ::continue::
  end

  -- filter git ignored files
  local git_files = list_files_git(files)

  return git_files
end

local function get_extensions(files)
  local ext_set = {}
  local exclude = { exe = true, lib = true, dll = true }

  for _, file in ipairs(files) do
    local filename = file:match("^.+/(.+)$") or file

    -- skip dotfiles with no base name (no chars before dot)
    if filename:sub(1,1) == "." and not filename:match(".+%.") then
      goto continue
    end

    local ext = filename:match("^.+%.([^.]+)$")
    if ext and not exclude[ext:lower()] then
      ext_set[ext:lower()] = true
    end

    ::continue::
  end

  local unique_exts = {}
  for ext in pairs(ext_set) do
    table.insert(unique_exts, ext)
  end
  table.sort(unique_exts)
  return unique_exts
end

local function choose_extension(callback)
  local files = list_files_git()
  local extensions = get_extensions(files)

  if #extensions == 0 then
    print("No valid file extensions found.")
    callback(nil)
    return
  end

  -- Create numbered display labels
  local items = {}
  local index_to_ext = {}
  for i, ext in ipairs(extensions) do
    local label = string.format("%d. %s", i, ext)
    table.insert(items, label)
    index_to_ext[label] = ext  -- map label back to original extension
  end

  vim.ui.select(items, { prompt = "Choose a file extension:" }, function(choice)
    if choice then
      local selected_ext = index_to_ext[choice]
      print("You selected: " .. selected_ext)
      callback(selected_ext)
    else
      print("No extension selected.")
      callback(nil)
    end
  end)
end

local telescope = require("telescope.builtin")

local function choose_extension_then_find_files()
  choose_extension(function(ext)
    if not ext then return end
    -- Use Telescope's find_files with a custom 'find_command' filtering for the extension
    telescope.find_files({
      prompt_title = "Files with extension ." .. ext,
      search_file = "*." .. ext,
    })
  end)
end

-- Map <leader>fe to run the chooser + Telescope finder
vim.keymap.set("n", "<leader>fe", choose_extension_then_find_files, { desc = "Find files by extension" })
