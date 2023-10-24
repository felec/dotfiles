return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(plugin)
      local colors = {
        red = "#f38ba8",
        black = "#0c0c0C",
        gray = "#313244",
        white = "#dfdfe0",
        cyan = "#00e8e4",
        blue = "#00b2ff",
      }

      local theme = {
        normal = {
          a = { fg = colors.black, bg = colors.blue },
          b = { fg = colors.blue, bg = colors.gray },
          c = { fg = colors.gray, bg = colors.black },
          z = { fg = colors.gray, bg = colors.black },
        },
        insert = { a = { fg = colors.black, bg = colors.white } },
        visual = { a = { fg = colors.black, bg = colors.cyan } },
        replace = { a = { fg = colors.black, bg = colors.cyan } },
      }

      local vim_icons = {
        function()
          return " "
        end,
        separator = { left = "", right = "" },
        color = { bg = colors.gray, fg = colors.cyan },
      }

      local space = {
        function()
          return " "
        end,
        color = { bg = colors.black, fg = colors.black },
      }

      local filename = {
        "filename",
        color = { bg = colors.blue, fg = colors.black },
        separator = { left = "", right = "" },
      }

      local filetype = {
        "filetype",
        icon_only = true,
        colored = true,
        color = { bg = colors.gray },
        separator = { left = "", right = "" },
      }

      local fileformat = {
        "fileformat",
        color = { bg = "#dfdfe0", fg = colors.black },
        separator = { left = "", right = "" },
      }

      local encoding = {
        "encoding",
        color = { bg = colors.gray, fg = colors.white },
        separator = { left = "", right = "" },
      }

      local branch = {
        "branch",
        color = { bg = colors.gray, fg = colors.white },
        separator = { left = "", right = "" },
        icon = { "", align = "left" },
      }

      local diff = {
        "diff",
        symbols = {
          added = "+",
          modified = "~",
          removed = "-",
        },
        separator = { left = "", right = "" },
      }

      local progress = {
        "progress",
        color = { bg = colors.blue, fg = colors.black },
        separator = { left = "", right = "" },
      }

      local modes = {
        "mode",
        fmt = function(str)
          return str:sub(1, 1)
        end,
        color = { bg = colors.white, fg = colors.black },
        separator = { left = "", right = "" },
      }

      local function getLspName()
        local msg = "───"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return "  " .. client.name
          end
        end
        return "  " .. msg
      end

      local dia = {
        "diagnostics",
        color = { bg = colors.gray, fg = colors.white },
        separator = { left = "", right = "" },
      }

      local lsp = {
        function()
          return getLspName()
        end,
        separator = { left = "", right = "" },
        color = { bg = colors.red, fg = colors.black },
      }

      return {
        options = {
          theme = theme,
          globalstatus = true,
          icons_enabled = true,
          always_divide_middle = true,
          section_separators = "",
          component_separators = "",
          disabled_filetypes = { statusline = { "lazy", "alpha" } },
          ignore_focus = {},
        },
        sections = {
          lualine_a = {
            vim_icons,
            modes,
          },
          lualine_b = {
            space,
            branch,
            diff,
          },
          lualine_c = {
            space,
            filename,
            {
              function()
                return require("nvim-navic").get_location()
              end,
              cond = function()
                return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
              end,
            },
          },
          lualine_x = {
            space,
          },
          lualine_y = {
            encoding,
            filetype,
            fileformat,
            space,
            progress,
          },
          lualine_z = {
            space,
            dia,
            lsp,
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      }
    end,
  },
}
