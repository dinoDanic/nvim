require("neo-tree").setup({
  popup_border_style = "rounded",
  close_if_last_window = true,
  enable_git_status = true,
  enable_diagnostics = false,
  event_handlers = {
    {
      event = "file_opened",
      handler = function(file_path)
        -- auto close
        -- vimc.cmd("Neotree close")
        -- OR
        require("neo-tree.command").execute({ action = "close" })
      end
    },
  }
})
