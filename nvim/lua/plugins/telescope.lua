return {
  {
    "telescope.nvim",
    opts = {
      defaults = { path_display = { "smart" } },
    },
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
