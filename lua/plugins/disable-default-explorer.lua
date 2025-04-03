return {
  -- Disable the default file explorer from LazyVim
  {
    "neo-tree.nvim",
    enabled = false,
  },
  
  -- Remove nvim-tree if it's included
  {
    "nvim-tree.lua",
    enabled = false,
  },
  
  -- Add our own file explorer configuration
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        position = "left",
        width = 40,
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
        },
      },
    },
  }
} 