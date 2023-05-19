return {
  {
    "goolord/alpha-nvim",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
                                  __
     ___     ___    ___   __  __ /\_\    ___ ___
    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\
   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \
   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/
  ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("s", "" .. "  Restore Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("r", "" .. "  Recent Files", ":Telescope oldfiles <CR>"),
        dashboard.button("f", "" .. "  Find Files", ":Telescope find_files <CR>"),
        dashboard.button("g", "" .. "  Grep", ":Telescope live_grep <CR>"),
        dashboard.button("u", "" .. "  Update", ":Lazy update <CR>"),
        dashboard.button("h", "" .. "  Health", ":Lazy health <CR>"),
        dashboard.button("q", "󰗼" .. "  Quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
  },
}
