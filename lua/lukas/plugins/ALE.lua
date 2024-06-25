local function list_verilog_files_as_string()
    local files = {}
    local current_dir = vim.fn.getcwd()

    -- Define the file extensions to search for
    local extensions = {'.v', '.sv'}

    -- Iterate over the extensions
    for _, ext in ipairs(extensions) do
        -- Use vim.loop to scan the directory
        local dir_iter, dir_handle = vim.loop.fs_scandir(current_dir)
        if dir_handle then
            repeat
                local name, type = vim.loop.fs_scandir_next(dir_iter)
                if name and type == 'file' and name:match(ext..'$') then
                    table.insert(files, name)
                end
            until not name
            vim.loop.fs_closedir(dir_handle)
        end
    end

    -- Concatenate filenames with spaces
    local files_str = table.concat(files, ' ')

    return files_str
end

-- Example usage
local verilog_files_str = list_verilog_files_as_string()
print(verilog_files_str)  -- Print the space-separated string of files (for debugging)
return {
  "dense-analysis/ale",
  config = function()
    -- ALE configuration
    vim.g.ale_linters_explicit = true
    vim.g.ale_linters = {
      verilog_systemverilog = {'slang'},
    }
    vim.g.ale_fix_on_save = true

    -- Dynamically set include directory to current working directory
    local current_dir = vim.fn.getcwd()

    -- Set SLang options for both Verilog and SystemVerilog
    vim.g.ale_verilog_slang_options = list_verilog_files_as_string()
    vim.g.ale_systemverilog_slang_options = list_verilog_files_as_string()
  end
}
