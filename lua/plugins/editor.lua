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

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-`>", desc = "Toggle Terminal" },
      { "<leader>tf", desc = "Float Terminal" },
      { "<leader>th", desc = "Horizontal Terminal" },
      { "<leader>tv", desc = "Vertical Terminal" },
    },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-`>]],
      direction = "float",
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 3,
      },
      highlights = {
        FloatBorder = { guifg = "#7aa2f7" },
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- Floating terminal
      vim.keymap.set("n", "<leader>tf", function()
        require("toggleterm").toggle(1, nil, nil, "float")
      end, { desc = "Float Terminal" })

      -- Horizontal terminal
      vim.keymap.set("n", "<leader>th", function()
        require("toggleterm").toggle(2, 15, nil, "horizontal")
      end, { desc = "Horizontal Terminal" })

      -- Vertical terminal
      vim.keymap.set("n", "<leader>tv", function()
        require("toggleterm").toggle(3, vim.o.columns * 0.4, nil, "vertical")
      end, { desc = "Vertical Terminal" })

      -- Terminal mode keymaps (terminal icindeyken pencere gecisi)
      function _G.set_terminal_keymaps()
        local kopts = { buffer = 0 }
        vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]], kopts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], kopts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], kopts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], kopts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], kopts)
      end

      vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
    end,
  },
}
