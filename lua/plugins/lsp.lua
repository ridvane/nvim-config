return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Enable the following language servers
        gopls = {},
        tsserver = {},
        rust_analyzer = {},
        pyright = {},
        jdtls = {},
      },
    },
  },
  
  -- Add Mason to manage LSP servers, DAP servers, formatters, and linters
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP
        "gopls",
        "typescript-language-server",
        "rust-analyzer",
        "pyright",
        "jdtls",
        
        -- Formatters
        "prettier",
        "stylua",
        "gofumpt",
        "black",
        "rustfmt",
        
        -- Linters
        "eslint_d",
        "golangci-lint",
        "ruff",
      },
    },
  },
} 