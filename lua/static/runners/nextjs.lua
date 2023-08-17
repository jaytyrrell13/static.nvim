local M = {}

local nextPath = 'node_modules/.bin/next'

M.build = nextPath .. ' build'

M.serve = nextPath .. ' dev'

M.prod = nil

return M
