return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
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
