local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- keymap("n", "<C-a>", ":!tmux resize-pane -L 10 <cr>", opts)
-- keymap("n", "<C-s>", ":!tmux resize-pane -R 10 <cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
keymap("i", "jk", "<ESC>", opts)
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- delete single character without copying into register
keymap("n", "x", '"_x', opts)

-- telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files hidden=true<cr>", opts) -- find files within current working directory, respects .gitignore
keymap("n", "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", opts)    -- find string in current working directory as you type
keymap("n", "<leader>r", "<cmd>Telescope registers<cr>", opts)

-- git
keymap("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", opts)
keymap("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", opts)
keymap("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", opts)
keymap("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", opts)
keymap("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", opts)
keymap("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", opts)
keymap("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", opts)
keymap("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", opts)
keymap("n", "<leader>go", "<cmd>Telescope git_status<cr>", opts)
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts)
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts)
keymap("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", opts)

-- clear search highlights
keymap("n", "<leader>h", ":nohl<CR>", opts)

-- diagnostics
keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- nvim tree
-- keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
-- keymap("n", "<leader>r", "<cmd>NvimTreeFocus<cr>", opts)
-- keymap("n", "<leader>R", "<cmd>NvimTreeCollapse<cr>", opts)
-- keymap("n", "<leader>w", "<cmd>w!<CR>", opts)

-- nvim tree
-- keymap("n", "<leader>e", "<cmd>Neotree toggle float<cr>", opts)
keymap("n", "<leader>e", "<cmd>Neotree toggle reveal<cr>", opts)
-- keymap("n", "<leader>e", "<cmd>:Explore<cr><cr>", opts)

-- buffers
keymap("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", opts)
keymap("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", opts)
keymap("n", "<leader>bf", "<cmd>Telescope buffers<cr>", opts) -- list open buffers in current neovim instance
keymap("n", "<leader>c", "<cmd>Bdelete!<CR>", opts)

--- lsp
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{async = true}<cr>", opts)
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts) -- Rename with LSP

-- search
keymap("n", "<leader>sc", "<cmd>Telescope colorscheme<cr>", opts)
keymap("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", opts)
keymap("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", opts)
keymap("n", "<leader>st", "<cmd>Telescope help_tags<cr>", opts)            -- list available help tags
keymap("n", "<leader>ss", "<cmd>Telescope grep_string<cr>", opts)          -- find string under cursor in current working directory
-- keymap("n", "<leader>sf", "<cmd>Telescope flutter commands<cr>", opts)
keymap("n", "<leader>sf", "<cmd>Telescope flutter fvm commands<cr>", opts) -- with fvm

-- register
keymap("n", "<leader>\"", "<cmd>register<cr>", opts) -- find string under cursor in current working directory

-- Files
keymap("n", "<leader>w", "<cmd>w!<cr>", opts)
keymap("n", "<leader>q", "<cmd>q!<cr>", opts)
keymap("n", "<leader>p", "\"_dP", opts)
keymap("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", opts)
keymap("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", opts)
keymap("n", "<leader>.", "<cmd>luafile %<CR>", opts)
