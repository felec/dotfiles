return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP
        "glint",
        "pyright",
        "css-lsp",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "bash-language-server",
        "yaml-language-server",
        "dockerfile-language-server",
        "typescript-language-server",
        "tailwindcss-language-server",
        "mdx-analyzer",
        -- Linter
        "ruff",
        "markdownlint",
        "jsonlint",
        -- DAP
        "js-debug-adapter",
        "bash-debug-adapter",
        -- Formatter
        "shfmt",
        "stylua",
        "yamlfmt",
        "prettier",
      },
    },
  },
}
