local options = {
  backup = false,                                  -- creates a backup file
  clipboard = "unnamedplus",                       -- allows neovim to access the system clipboard
  cmdheight = 0,                                   -- more space in the neovim command line for displaying messages
  completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
  fileencoding = "utf-8",                          -- the encoding written to a file
  hlsearch = true,                                 -- highlight all matches on previous search pattern
  ignorecase = true,                               -- ignore case in search patterns
  mouse = "a",                                     -- allow the mouse to be used in neovim
  pumheight = 10,                                  -- pop up menu height
  showmode = true,                                 -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0,                                 -- always show tabs
  smartcase = true,                                -- smart case
  smartindent = true,                              -- make indenting smarter again
  splitbelow = true,                               -- force all horizontal splits to go below current window
  splitright = true,                               -- force all vertical splits to go to the right of current window
  swapfile = false,                                -- creates a swap file
  termguicolors = true,                            -- set term ui colors (most terminals support this)
  undofile = true,                                 -- enable persistent undo
  timeoutlen = 500,                                -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 50,                                 -- faster completion (4000ms default)
  writebackup = false,                             -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                                -- convert tabs to spaces
  shiftwidth = 2,                                  -- the number of spaces inserted for each indentation
  tabstop = 2,                                     -- insert 2 spaces for a tab
  cursorline = true,                               -- highlight the current line
  number = true,                                   -- set numbered lines
  relativenumber = true,                           -- set relative numbered lines
  numberwidth = 2,                                 -- set number column width to 2 {default 4}
  signcolumn = "yes",                              -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                                    -- display lines as one long line
  scrolloff = 8,                                   -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17",                       -- the font used in graphical neovim applications
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- set cmd height in macro mode
vim.api.nvim_command("autocmd RecordingEnter * set cmdheight=1")
vim.api.nvim_command("autocmd RecordingLeave * set cmdheight=0")

-- re size screen
vim.api.nvim_exec([[
  augroup AutoEqualize
    autocmd!
    autocmd VimEnter,VimResized * :wincmd =
  augroup END
]], false)

-- remove auto comment line
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- remove status bar
vim.opt.laststatus = 0

-- spell check
-- vim.opt.spelllang = 'en_us'
-- vim.opt.spell = true
