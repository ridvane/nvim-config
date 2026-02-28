return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>N", "", desc = "+notes" },
      { "<leader>Nn", "<cmd>ObsidianNew<cr>", desc = "Yeni not" },
      { "<leader>Nf", "<cmd>ObsidianQuickSwitch<cr>", desc = "Not ara" },
      { "<leader>Ns", "<cmd>ObsidianSearch<cr>", desc = "Notlarda icerik ara" },
      { "<leader>Nd", "<cmd>ObsidianToday<cr>", desc = "Bugunun notu" },
      { "<leader>Nb", "<cmd>ObsidianBacklinks<cr>", desc = "Backlinks" },
      { "<leader>Nt", "<cmd>ObsidianTags<cr>", desc = "Etiketlere gore ara" },
      { "<leader>Nc", "<cmd>ObsidianToggleCheckbox<cr>", desc = "Checkbox toggle" },
      { "<leader>Nl", "<cmd>ObsidianLinks<cr>", desc = "Bu nottaki linkler" },
      { "<leader>Np", "<cmd>ObsidianPasteImg<cr>", desc = "Resim yapistir" },
      { "<leader>No", "<cmd>ObsidianOpen<cr>", desc = "Obsidian'da ac" },
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/notes",
        },
      },
      notes_subdir = "inbox",
      new_notes_location = "notes_subdir",
      daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },
      ui = {
        enable = true,
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
        },
      },
    },
  },
}
