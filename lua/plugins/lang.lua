return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {},
        ts_ls = {},
        rust_analyzer = {},
        pyright = {},
        jdtls = {
          settings = {
            java = {
              format = {
                settings = {
                  url = "",
                },
                tabSize = 4,
                insertSpaces = true,
              },
            },
          },
        },
      },
    },
  },

  {
    "mason-org/mason.nvim",
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
        "goimports",
        "black",
        "isort",
        "rustfmt",
        "shfmt",
        -- Linters
        "eslint_d",
        "golangci-lint",
        "ruff",
        "markdownlint-cli2",
        "markdown-toc",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        go = { "goimports", "gofumpt" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        java = { lsp_format = "prefer" },
        sh = { "shfmt" },
        bash = { "shfmt" },
      },
    },
  },
}
