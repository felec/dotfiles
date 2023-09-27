return {
  {
    "akinsho/toggleterm.nvim",
    config = true,
    opts = {
      direction = "vertical",
      persist_mode = false,
      auto_scroll = false,
      insert_mappings = false,
      terminal_mappings = false,
      size = function()
        return vim.o.columns * 0.25
      end,
    },
  },
}
