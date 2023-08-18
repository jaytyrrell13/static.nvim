local M = {}

function M.neovim(command)
  vim.cmd('botright new')
  vim.cmd('terminal ' .. command)
  vim.cmd('startinsert')
end

function M.execute(command)
  local config = require('static.config')
  local strategy = config.options.strategy or 'neovim'

  if not M[strategy] then
    vim.notify('Could not determine the correct strategy. Received: ' .. strategy, vim.log.levels.WARN)
    return
  end

  M[strategy](command)
end

return M
