return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
    },
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
        },
      },
      plugins = {
        gitsigns = { enabled = false },
        tmux = { enabled = true },
      },
    },
  },

  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "VeryLazy",
  },

  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        replace_netrw = true,
      },
    },
  },
}
