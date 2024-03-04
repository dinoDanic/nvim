local lsp_zero = require('lsp-zero')

require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)


require('lspconfig').tsserver.setup({})
require('lspconfig').lua_ls.setup({})
require("lspconfig").svelte.setup({})
require("lspconfig").elixirls.setup({})
require("lspconfig").templ.setup({})
require("lspconfig").gleam.setup({})
require("lspconfig").gopls.setup({
  fileType = { "html", "templ" }
})

require("lspconfig").tailwindcss.setup {
  filetypes = { "templ", "astro", "javascript", "typescript", "react", "svelte" },
  init_options = { userLanguages = { templ = "html" } },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "cva\\(([^)]*)\\)",
            "[\"'`]([^\"'`]*).*?[\"'`]" },
        },
      },
    },
  },
}


vim.diagnostic.config({ virtual_text = true })

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
