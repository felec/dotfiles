return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        window = {
          mappings = {
            ["y"] = "yank_path",
          },
        },
        commands = {
          yank_path = function(state)
            -- copy path of current node to unnamed register
            vim.fn.setreg("+", state.tree:get_node().path)
          end,
        },
      },
    },
  },
}
