local M = {}

local actions = { 'build', 'serve', 'prod' }

local execute = function(args)
  -- action == build, serve, prod
  local arguments = args.fargs
  local action = arguments[1]
  -- remove the first argument which is the action
  table.remove(arguments, 1)

  local _, runner = require('static.runners').find()

  if not runner then
    vim.notify('Could not determine the correct runner.', vim.log.levels.WARN)
    return
  end

  local command = runner[action]

  if command == nil then
    vim.notify('Command is not supported. Please try a different command.', vim.log.levels.WARN)
    return
  end

  local cmd = command .. ' ' .. table.concat(arguments, ' ')

  local strategies = require('static.strategies')
  strategies.execute(cmd)
end

function M.setup(opts)
  local Config = require('static.config')
  Config.setup(opts)

  vim.api.nvim_create_user_command('Static', execute, {
    nargs = '*',
    complete = function()
      return actions
    end,
  })
end

return M
