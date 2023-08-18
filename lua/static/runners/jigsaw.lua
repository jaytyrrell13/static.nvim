local M = {}

local jigsawPath = 'vendor/bin/jigsaw'

M.build = jigsawPath .. ' build'

M.serve = jigsawPath .. ' serve'

M.prod = jigsawPath .. ' build production'

return M
