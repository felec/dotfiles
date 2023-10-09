-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Setup for vim
map("n", "<c-j>", "<cmd>call append(line('.'), '')<cr>", { desc = "Insert blank line below" })
map("n", "<c-k>", "<cmd>call append(line('.')-1, '')<cr>", { desc = "Insert blank line above" })

map("i", "jj", "<esc>", { desc = "Exit insert mode" })
map("i", "<c-l>", "<c-o>a", { desc = "Move right of enclosing surround object" })

-- Setup for treesj
-- map("n", "<leader>m", function()
--   require("treesj").toggle({ split = { recursive = true } })
-- end, { desc = "Toggle (split/join) node under cursor" })

--Setup for chatgpt
map("n", "<leader>cp", "<cmd>ChatGPT<cr>", { desc = "ChatGPT general prompt" })
-- map("n", "<leader>cs", "<cmd>ChatGPTActAs<cr>", { desc = "ChatGPT selection prompt" })
-- map("v", "<leader>ci", "<cmd>ChatGPTEditWithInstructions<cr>", { desc = "ChatGPT interactive prompt" })

--Setup for toggleterm
map("n", "<leader>1", "<cmd>ToggleTerm<cr>", { desc = "Open toggleterm window" })
map("n", "<leader>2", "<cmd>ToggleTerm 2<cr>", { desc = "Open toggleterm second window" })

--Setup for terminal keymaps
function _G.set_terminal_keymaps()
  -- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  -- vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
  -- vim.keymap.set("t", "jj", [[<C-\><C-n>]], { buffer = 0, desc = "exit insert mode" })
  map("t", "<c-h>", "<cmd>wincmd h<cr>", { buffer = 0, desc = "Move left window" })
  map("t", "<c-j>", "<cmd>wincmd j<cr>", { buffer = 0, desc = "Move down window" })
  map("t", "<c-k>", "<cmd>wincmd k<cr>", { buffer = 0, desc = "Move up window" })
  map("t", "<c-l>", "<cmd>wincmd l<cr>", { buffer = 0, desc = "Move right window" })
end
