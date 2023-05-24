require("bufferline").setup{
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
        {
          filetype = "NvimTree",
          text = "",
          highlight = "Directory",
          separator = false -- use a "true" to enable the default, or set your own character
        }
     },
    show_buffer_close_icons = false,
    show_lose_icons = false,
  }
}
