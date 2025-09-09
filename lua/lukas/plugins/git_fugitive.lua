return {
  "tpope/vim-fugitive",
  config = function ()
    vim.api.nvim_create_user_command("GS", function(opts)
      vim.cmd("Git switch " .. opts.args)
    end, {
      nargs = 1,
      complete = function(_, line)
        -- Get local branches from git
        local handle = io.popen("git branch --format='%(refname:short)' 2>/dev/null")
        if not handle then return {} end
        local result = {}
        for branch in handle:lines() do
          table.insert(result, branch)
        end
        handle:close()
        return result
      end,
    })

    vim.api.nvim_create_user_command("GC", function()
      vim.cmd("Git commit ")
    end, {})

    vim.api.nvim_create_user_command("GA", function()
      vim.cmd("Git add .")
    end, {})
  end
}
