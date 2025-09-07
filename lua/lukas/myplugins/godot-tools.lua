-- lua/lukas/myplugins/godot-tools.lua
local curl = require("plenary.curl")

local GDServer = {}

-- Echo test
function GDServer:Echo()
  local res = curl.post("http://127.0.0.1:4000/echo")
  print("Server response:", res.body)
end

-- Get scenes
function GDServer:Scenes()
  local res = curl.get("http://127.0.0.1:4000/scenes")
  print("Scenes response:", res.body)
end

-- Get nodes for a scene
-- Pass scene_id as argument
function GDServer:Nodes(scene_id)
  if not scene_id then
    print("Usage: :GDNodes <scene_id>")
    return
  end
  local res = curl.get("http://127.0.0.1:4000/nodes?scene_id=" .. scene_id)
  print("Nodes response:", res.body)
end

-- Setup commands
vim.api.nvim_create_user_command("GDEcho", function()
  GDServer:Echo()
end, {})

vim.api.nvim_create_user_command("GDScenes", function()
  GDServer:Scenes()
end, {})

vim.api.nvim_create_user_command("GDNodes", function(opts)
  GDServer:Nodes(opts.args)
end, { nargs = 1 })

--OR later  to how to lauch it and ensure closing
-- -- Run batch file
-- local batch_job = vim.fn.jobstart("D:\\path\\to\\your\\batch_file.bat", {
--     stdout_buffered = true,
--     stderr_buffered = true,
--     on_stdout = function(_, data)
--         if data then print(table.concat(data, "\n")) end
--     end,
--     on_stderr = function(_, data)
--         if data then print("ERR: " .. table.concat(data, "\n")) end
--     end,
-- })
--
-- vim.api.nvim_create_autocmd("VimLeavePre", {
--     callback = function()
--         if batch_job then
--             vim.fn.jobstop(batch_job)
--         end
--     end,
-- })

return GDServer


