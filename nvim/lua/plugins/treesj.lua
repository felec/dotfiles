return {
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter" },
    config = function()
      local lang_utils = require("treesj.langs.utils")

      local scala = {
        import_declaration = lang_utils.set_preset_for_dict(),
        arguments = lang_utils.set_preset_for_args(),
        parameters = lang_utils.set_preset_for_args(),
        block = lang_utils.set_preset_for_statement(),
        if_expression = { target_nodes = { "block" } },
        function_definition = { target_nodes = { "block" } },
      }

      require("treesj").setup({ langs = { scala } })
    end,
  },
}
