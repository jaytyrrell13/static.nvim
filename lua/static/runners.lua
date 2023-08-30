local M = {}

M.runners = {
  jigsaw = {
    file = 'jigsaw',
    path = vim.fn.getcwd() .. '/vendor/bin',
    build = 'vendor/bin/jigsaw build',
    serve = 'vendor/bin/jigsaw serve',
    prod = 'vendor/bin/jigsaw build production',
  },
  hugo = {
    file = 'hugo.toml',
    path = vim.fn.getcwd(),
    build = 'hugo',
    serve = 'hugo server',
    prod = 'hugo --gc --minify',
  },
  eleventy = {
    file = 'eleventy.config.js',
    path = vim.fn.getcwd(),
    build = 'npm run build',
    serve = 'npm run start',
    prod = nil,
  },
  nextjs = {
    file = 'next.config.js',
    path = vim.fn.getcwd(),
    build = 'node_modules/.bin/next build',
    serve = 'node_modules/.bin/next dev',
    prod = nil,
  },
  gatsby = {
    file = 'gatsby-config.js',
    path = vim.fn.getcwd(),
    build = 'npx gatsby build',
    serve = 'npx gatsby develop',
    prod = nil,
  },
  nuxtjs = {
    file = 'nuxt.config.ts',
    path = vim.fn.getcwd(),
    build = 'npx nuxi build',
    serve = 'npx nuxi dev',
    prod = nil,
  },
  hexo = {
    file = 'hexo',
    path = vim.fn.getcwd() .. '/node_modules/.bin',
    build = 'npx hexo generate',
    serve = 'npx hexo server',
    prod = nil,
  },
  astro = {
    file = 'astro.config.mjs',
    path = vim.fn.getcwd(),
    build = 'npx astro build',
    serve = 'npx astro dev',
    prod = nil,
  },
}

M.find = function()
  for name, runner in pairs(M.runners) do
    local r = vim.fs.find(runner.file, {
      path = runner.path,
    }, { type = 'file' })

    if next(r) then
      return name, runner
    end
  end
end

return M
