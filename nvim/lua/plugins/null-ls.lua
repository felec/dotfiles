return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.diagnostics.mypy,
          nls.builtins.diagnostics.shellcheck,
          nls.builtins.diagnostics.jsonlint,
          nls.builtins.diagnostics.markdownlint,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.black,
          nls.builtins.formatting.prettier.with({
            filetypes = {
              "javascript",
              "typescript",
              "javascriptreact",
              "typescriptreact",
              "css",
              "scss",
              "html",
              "json",
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
