return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    },
    opts = {
      options = {
        always_show_bufferline = true,
        separator_style = "slant",
        indicator = { style = "none" },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        truncate_names = true,
        max_name_length = 30,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        diagnostics = "nvim_lsp",
        close_command = function(n)
          Snacks.bufdelete(n)
        end,
        right_mouse_command = function(n)
          Snacks.bufdelete(n)
        end,
        diagnostics_indicator = function(_, _, diag)
          local icons = require("lazyvim.config").icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        numbers = function(opts)
          return string.format("%s", opts.raise(opts.ordinal))
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "",
            highlight = "Directory",
            text_align = "left",
          },
        },
        groups = {
          options = { toggle_hidden_on_enter = true },
          items = {
            {
              name = "  BE",
              priority = 1,
              matcher = function(buf)
                return vim.endswith(buf.path, ".scala")
                  or vim.endswith(buf.path, ".java")
                  or vim.endswith(buf.path, ".py")
                  or vim.endswith(buf.path, ".cpp")
                  or vim.endswith(buf.path, ".cs")
                  or vim.endswith(buf.path, ".go")
                  or vim.endswith(buf.path, ".scad")
                  or vim.endswith(buf.path, ".rs")
                  or vim.endswith(buf.path, ".sh")
              end,
            },
            {
              name = "謹 FE",
              priority = 2,
              matcher = function(buf)
                return vim.endswith(buf.path, ".js")
                  or vim.endswith(buf.path, ".ts")
                  or vim.endswith(buf.path, ".jsx")
                  or vim.endswith(buf.path, ".tsx")
                  or vim.endswith(buf.path, ".html")
              end,
            },
            {
              name = " CSS",
              priority = 3,
              matcher = function(buf)
                return vim.endswith(buf.path, ".css") or vim.endswith(buf.path, ".scss")
              end,
            },
          },
        },
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
  },
}
