local actions = require("telescope.actions")
require('telescope').setup { 
    defaults = {
      mappings = {
        n = {
          ['<C-s>'] = actions.send_selected_to_qflist + actions.open_qflist,
        },
        i = {
          ['<C-s>'] = actions.send_selected_to_qflist + actions.open_qflist,
          ['<c-u>'] = false,
          ['<c-d>'] = false,
        },
      },
      pickers = {
        -- Default config for builtin pickers:
        find_files = {
          no_ignore = true,
        },
      },
    },
}
pcall(require('telescope').load_extension, 'fzf')
-- telescope live_grep in git root
-- function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- if the buffer is not associated with a file, return nil
  if current_file == "" then
    current_dir = cwd
  else
    -- extract the directory from the current file's path
    curret_dir = vim.fn.fnamemodify(current_file, ":h")
  end

  -- find the git root directory from the current file's path
  local git_root = vim.fn.systemlist("git -c " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    print("not a git repository. searching on current working directory")
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep({
      search_dirs = {git_root},
    })
  end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})
