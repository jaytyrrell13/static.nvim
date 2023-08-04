return {
  jigsaw = {
    file = 'jigsaw',
    path = vim.fn.getcwd() .. '/vendor/bin',
    build_command = 'vendor/bin/jigsaw build',
    serve_command = 'vendor/bin/jigsaw serve',
  },
  hugo = {
    file = 'hugo.toml',
    path = vim.fn.getcwd(),
    build_command = 'hugo',
    serve_command = 'hugo server',
  },
  eleventy = {
    file = 'eleventy.config.js',
    path = vim.fn.getcwd(),
    build_command = 'npx @11ty/eleventy',
    serve_command = 'npx @11ty/eleventy --serve',
  },
}
