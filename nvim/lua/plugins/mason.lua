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
        "mypy",
        "markdownlint",
        "jsonlint",
        -- DAP
        "js-debug-adapter",
        "bash-debug-adapter",
        -- Formatter
        "shfmt",
        "black",
        "stylua",
        "yamlfmt",
        "prettier",
      },
    },
  },
}
