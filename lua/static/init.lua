local M = {}

local actions = { 'build', 'serve', 'prod' }
local runners = require('static.runners')
local runnerNames = vim.tbl_keys(runners.runners)

local execute = function(args)
  -- action == build, serve, prod
  local arguments = args.fargs
  local runnerName
  local runner
  local action

  -- If the second argument is the name of a runner
  -- e.g. :Static astro build
  if vim.tbl_contains(runnerNames, arguments[1]) then
    runnerName = arguments[1]
    action = arguments[2]

    table.remove(arguments, 2)
    table.remove(arguments, 1)
  else
    action = arguments[1]
    table.remove(arguments, 1)
  end

  _, runner = runners.find(runnerName)

  if not runner then
    vim.notify('Could not determine the correct runner.', vim.log.levels.WARN)
    return
  end

  if not action then
    vim.notify('Could not determine the action.', vim.log.levels.WARN)
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
  local config = require('static.config')
  config.setup(opts)

  vim.api.nvim_create_user_command('Static', execute, {
    nargs = '+',
    complete = function(_, line)
      local parts = vim.split(vim.trim(line), '%s+')

      if parts[1]:find('Static') then
        table.remove(parts, 1)
      end

      if line:sub(-1) == ' ' then
        parts[#parts + 1] = ''
      end

      table.remove(parts, 1)

      if #parts > 0 then
        return actions
      end

      local merged = {}

      for _, value in pairs(actions) do
        table.insert(merged, value)
      end

      for _, value in pairs(runnerNames) do
        table.insert(merged, value)
      end

      return merged
    end,
  })
end

return M
