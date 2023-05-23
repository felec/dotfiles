return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
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
              name = "謹 FE",
              priority = 1,
              matcher = function(buf)
                return vim.endswith(buf.path, ".js")
                  or vim.endswith(buf.path, ".ts")
                  or vim.endswith(buf.path, ".jsx")
                  or vim.endswith(buf.path, ".tsx")
                  or vim.endswith(buf.path, ".html")
              end,
            },
            {
              name = "  BE",
              priority = 2,
              matcher = function(buf)
                return vim.endswith(buf.path, ".scala")
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
  },
}
