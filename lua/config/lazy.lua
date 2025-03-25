local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- import LazyVim plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    
    -- import any extras modules here
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.java" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.go" },
    
    -- import/override with your plugins
    { import = "plugins" },
    
    -- Replace the copilot import with direct plugin specification
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      build = ":Copilot auth",
      opts = {
        suggestion = { enabled = true },
        panel = { enabled = true },
        filetypes = {
          markdown = true,
          help = true,
          lua = true,
          python = true,
          rust = true,
          go = true,
          typescript = true,
          javascript = true,
          ["."] = false,
        },
      },
    },
    
    -- Add git plugins directly
    { "lewis6991/gitsigns.nvim" },
    { "kdheepak/lazygit.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    
    -- Add fzf for Mason filtering
    {
      "junegunn/fzf",
      build = ":call fzf#install()"
    },
    
    -- Add multiple cursors support
    {
      "mg979/vim-visual-multi",
      branch = "master",
    },
    
    -- Add symbols outline for better code navigation
    {
      "simrat39/symbols-outline.nvim",
      config = true,
      keys = { { "<C-S-o>", ":SymbolsOutline<cr>", desc = "Symbols Outline" } },
    },
  },
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}) 