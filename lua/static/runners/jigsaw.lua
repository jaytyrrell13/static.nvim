local M = {}

local jigsawPath = 'vendor/bin/jigsaw'

M.build = jigsawPath .. ' build'

M.serve = jigsawPath .. ' serve'

M.prod = jigsawPath .. ' build production'

-- local buildCmdArgs = function(runnerConfig) end

-- function M.buildArgs(action, runnerConfig)
-- local func = string.format('%sCmdArgs', action)
-- func(runnerConfig)
-- end

return M
