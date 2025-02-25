return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  build = (not LazyVim.is_win())
      and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
    or nil,
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
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
  },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
}
