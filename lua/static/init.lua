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

local execute = function(command)
  local runner = determine_runner()

  if not runner then
    vim.notify('Could not determine the correct runner!', vim.log.levels.WARN)
    return
  end

  local cmd = runner[command]
  if cmd == nil then
    vim.notify('Command is not supported. Please try a different command.', vim.log.levels.WARN)
    return
  end

  vim.cmd('botright new')
  vim.cmd('terminal ' .. cmd)
end

local build = function()
  execute('build_command')
end

local serve = function()
  execute('serve_command')
  vim.cmd('startinsert')
end

local prod = function()
  execute('prod_command')
end

function M.setup(_)
  vim.api.nvim_create_user_command('StaticBuild', build, {})
  vim.api.nvim_create_user_command('StaticServe', serve, {})
  vim.api.nvim_create_user_command('StaticProd', prod, {})
end

return M
