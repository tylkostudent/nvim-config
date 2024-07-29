Func = {}
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

Func.disable_autoformat = function()
  if vim.g.autoformat == 1 then 
    vim.g.autoformat = 0; 
  end
end

return Func
