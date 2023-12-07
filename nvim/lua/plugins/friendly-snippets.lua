return {
  {
    "rafamadriz/friendly-snippets",
    pin = true,
    config = function()
      local snip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/lua/plugins/snippets" } })
      require("luasnip.loaders.from_vscode").lazy_load({
        include = {
          "markdown",
          "docker",
          "shell",
          "html",
          "css",
          -- "scala",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
        },
      })
      snip.filetype_extend("html", { "html" })
      snip.filetype_extend("css", { "css" })
      snip.filetype_extend("typescript", { "javascript" })
      snip.filetype_extend("typescriptreact", { "javascript" })
      snip.filetype_extend("markdown", { "markdown" })
      snip.filetype_extend("docker", { "docker" })
      snip.filetype_extend("shell", { "shell" })
    end,
  },
}
