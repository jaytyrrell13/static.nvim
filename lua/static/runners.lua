return {
  {
    file = 'jigsaw',
    path = vim.fn.getcwd() .. '/vendor/bin',
    build_command = 'vendor/bin/jigsaw build',
    serve_command = 'vendor/bin/jigsaw serve',
    prod_command = 'vendor/bin/jigsaw build production',
  },
  {
    file = 'hugo.toml',
    path = vim.fn.getcwd(),
    build_command = 'hugo',
    serve_command = 'hugo server',
    prod_command = 'hugo --gc --minify',
  },
  {
    file = 'eleventy.config.js',
    path = vim.fn.getcwd(),
    build_command = 'npx @11ty/eleventy',
    serve_command = 'npx @11ty/eleventy --serve',
    prod_command = nil,
  },
  {
    file = 'next.config.js',
    path = vim.fn.getcwd(),
    build_command = 'node_modules/.bin/next build',
    serve_command = 'node_modules/.bin/next dev',
    prod_command = nil,
  },
}
