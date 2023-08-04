local M = {}

local runners = require('static.runners')

local determine_runner = function()
  for _, runner in pairs(runners) do
    local r = vim.fs.find(runner.file, {
      path = runner.path,
    }, { type = 'file' })

    if next(r) then
      return runner
    end
  end
end

local foo = function(command)
  local runner = determine_runner()

  if not runner then
    vim.notify('Could not determine the correct runner!', vim.log.levels.WARN)

    return
  end

  vim.cmd('botright new')
  vim.cmd('terminal ' .. runner[command])
end

local build = function()
  foo('build_command')
end

local serve = function()
  foo('serve_command')
  vim.cmd('startinsert')
end

function M.setup(_)
  vim.api.nvim_create_user_command('StaticBuild', build, {})
  vim.api.nvim_create_user_command('StaticServe', serve, {})
end

return M
