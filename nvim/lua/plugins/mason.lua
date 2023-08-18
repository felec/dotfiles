return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP
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
        -- Linter
        "mypy",
        "jsonlint",
        "shellcheck",
        "markdownlint",
        -- DSP
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
