local function my_on_attach(bufnr)
local api = require "nvim-tree.api"

local function opts(desc)
return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end

-- default mappings
api.config.mappings.default_on_attach(bufnr)

-- custom mappings
vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
vim.keymap.set('n', 'h', api.node.open.edit, opts('Open'))
end


require("nvim-tree").setup({
  on_attach = my_on_attach,
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  -- for project.nvim
  -- sync_root_with_cwd = true,
  -- respect_buf_cwd = true,
  -- for project.nvim
  update_focused_file = {
    enable = true,
    update_root = true
  },
  renderer = {
    root_folder_modifier = ":t",
    group_empty = false,
    icons = {
      git_placement = "signcolumn",
      show = {
        folder_arrow = false
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  filters = {
    dotfiles = false,
    exclude = {},
    custom = {},
  },
  git = {
    ignore = false,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})
