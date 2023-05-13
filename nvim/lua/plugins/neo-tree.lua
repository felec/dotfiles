return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
        use_libuv_file_watcher = true,
        window = {
          mappings = {
            ["y"] = "yank_path",
          },
        },
      },
      window = {
        mappings = {
          ["<space>"] = "none",
        },
      },
      default_component_configs = {
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        git_status = {
          symbols = {
            added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "󰅘",
            renamed = "",
            -- Status type
            untracked = "󰄱",
            ignored = "󰱒",
            unstaged = "󰛲",
            staged = "󰄵",
            conflict = "󰳤",
          },
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
}
