vim.o.termguicolors = true
-- Colorize
require 'colorizer'.setup({
  '*',
}, { mode = 'foreground', names = false })

-- vim.cmd [[ colorscheme gruvbox ]]
-- vim.cmd [[ colorscheme tokyonight-night ]]
-- colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
vim.cmd [[ colorscheme catppuccin ]]
-- vim.cmd [[ colorscheme kanagawa ]]

