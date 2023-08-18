local M = {}

M.runners = {
  jigsaw = {
    file = 'jigsaw',
    path = vim.fn.getcwd() .. '/vendor/bin',
  },
  hugo = {
    file = 'hugo.toml',
    path = vim.fn.getcwd(),
  },
  eleventy = {
    file = 'eleventy.config.js',
    path = vim.fn.getcwd(),
  },
  nextjs = {
    file = 'next.config.js',
    path = vim.fn.getcwd(),
  },
  gatsby = {
    file = 'gatsby-config.js',
    path = vim.fn.getcwd(),
  },
}

M.find = function()
  for name, runner in pairs(M.runners) do
    local r = vim.fs.find(runner.file, {
      path = runner.path,
    }, { type = 'file' })

    if next(r) then
      local runnerModule = require(string.format('static.runners.%s', name))
      return name, runnerModule
    end
  end
end

return M
