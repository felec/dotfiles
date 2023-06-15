return {
  {
    "akinsho/toggleterm.nvim",
    config = true,
    opts = {
      direction = "vertical",
      persist_mode = false,
      size = function()
        return vim.o.columns * 0.25
      end,
    },
  },
}
