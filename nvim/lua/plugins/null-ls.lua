return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.diagnostics.flake8,
          nls.builtins.diagnostics.shellcheck,
          nls.builtins.diagnostics.jsonlint,
          nls.builtins.diagnostics.markdownlint,
          nls.builtins.formatting.prettier.with({
            filetypes = {
              "javascript",
              "typescript",
              "css",
              "scss",
              "html",
              "json",
              -- "yaml",
              "markdown",
              "graphql",
              "md",
              "txt",
            },
          }),
        },
      }
    end,
  },
}
