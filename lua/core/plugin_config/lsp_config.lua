require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "tsserver", "graphql", "elixirls" }
})


local bufopts = { noremap = true, silent = true }

local on_attach = function(_, _)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require("lspconfig").tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require("lspconfig").elixirls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require("lspconfig").tailwindcss.setup {
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


vim.diagnostic.config({ virtual_text = false })



local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
