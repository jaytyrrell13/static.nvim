# static.nvim

Plugin for Neovim to enhance the experience of developing a site using a static site generator.

## Installation

[Lazy](https://github.com/folke/lazy.nvim):

```lua
{
    'jaytyrrell13/static.nvim',
    opts = {},
    keys = {
        { '<leader>Sb', ':Static build<cr>' },
        { '<leader>Ss', ':Static serve<cr>' },
        { '<leader>Sp', ':Static prod<cr>' },
    },
}
```

[Packer](https://github.com/wbthomason/packer.nvim):

```lua
use {
    'jaytyrrell13/static.nvim',
    config = function()
        require('static').setup()
    end
}
```

Add your preferred mappings to your configuration:

```
nmap <leader>Sb :Static build<cr>
nmap <leader>Ss :Static serve<cr>
nmap <leader>Sp :Static prod<cr>
```

## Usage

Supported Static Site Generators:

- [11ty](https://www.11ty.dev/)
- [Next.js](https://nextjs.org/)
- [Nuxt](https://nuxt.com/)
- [Gatsby](https://www.gatsbyjs.com/)
- [Jigsaw](https://jigsaw.tighten.com/)
- [Hugo](https://gohugo.io/)

### Commands

| Command | Description |
| :-----: | :---------: |
| `build` | Build the site for local development |
| `serve` | Start a webserver to view the site |
| `prod`  | Build the site for production |

**Note:** Some Static Site Generators do not support the `prod` command, use the `build` command instead.

### Parameters

Any parameters passed to one of the commands is passed along to the underlying command. For example, if you'd like to use a different port for the `serve` command, you can run:

```sh
:Static serve --port=8081
```

## Strategies

This plugin can execute the SSG commands using different methods called "strategies".

| Strategy | Identifier | Description |
| :---: | :---: | :--- |
| Basic (default) | `basic` | Runs commands using `!` |
| Neovim | `neovim` | Runs commands using `:terminal` in a horizontal split |
| Dispatch | `dispatch` `dispatch_background` | Runs commands using `:Dispatch` or `:Dispatch!` |

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)
