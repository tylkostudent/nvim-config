local curl = require("plenary.curl")
local codecks_api_keys = require("lukas.myplugins.codecks-api-keys")

local M = {}

-- Send content to Codecks
function M.send_codecks_report(content)
  local report_token = codecks_api_keys.DEFAULT_REPORT_TOKEN

  local result = curl.post("https://api.codecks.io/user-report/v1/create-report", {
    query = { token = report_token },
    headers = {
      ["Content-Type"] = "application/json"
    },
    body = vim.fn.json_encode({
      content = content,
    })
  })

  if result.status == 200 then
    local parsed = vim.fn.json_decode(result.body)
    vim.notify("✅ Codecks card created! Card ID: " .. parsed.cardId, vim.log.levels.INFO)
  else
    vim.notify("❌ Failed to create card.\n" .. vim.inspect(result), vim.log.levels.ERROR)
  end
end

-- Create a temporary buffer for card writing
function M.open_codecks_buffer()
  vim.cmd("belowright split")  -- horizontal split
  vim.cmd("enew")              -- new empty buffer
  local buf = vim.api.nvim_get_current_buf()

  vim.api.nvim_buf_set_option(buf, "buftype", "acwrite")
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_name(buf, "CodecksTODO")

  vim.api.nvim_create_autocmd("BufWriteCmd", {
    buffer = buf,
    once = true,
    callback = function()
      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      local content = table.concat(lines, "\n")
      M.send_codecks_report(content)
      vim.cmd("bd!")  -- close buffer after sending
    end,
  })
end

vim.api.nvim_create_user_command("CodecksTODO", function(opts)
  if opts.args and opts.args ~= "" then
    -- Called with inline card title
    local title = opts.args
    M.send_codecks_report(title .. "\n\nCreated from Neovim via :CodecksTODO.")
  else
    -- Called with no args: open input buffer
    M.open_codecks_buffer()
  end
end, {
  nargs = "*",
})
