return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
    keys = {
      { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diff View (tum degisiklikler)" },
      { "<leader>gV", "<cmd>DiffviewOpen HEAD~1<cr>", desc = "Diff View (son commit)" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Dosya gecmisi" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Repo gecmisi" },
      { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Diff View kapat" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = { layout = "diff2_horizontal" },
        merge_tool = { layout = "diff3_horizontal" },
      },
      file_panel = {
        listing_style = "tree",
        win_config = { position = "left", width = 35 },
      },
    },
  },
}
