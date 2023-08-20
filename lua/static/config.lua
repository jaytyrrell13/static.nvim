local M = {}

M.defaults = {
  strategy = 'basic',
}

-- Default options merged with user options
M.options = {}

function M.setup(opts)
  M.options = vim.tbl_deep_extend('force', M.defaults, opts or {})
end

return M
