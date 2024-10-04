vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "ESC" })
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "[E]xplorer" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "[W]rite File" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "[Q]uit" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa<cr>", { desc = "[Q]uit All" })
vim.keymap.set("n", "<leader>n", "<cmd>enew<cr>", { desc = "[N]ew File" })
vim.keymap.set("n", "<leader>k", "<cmd>checktime<cr>", { desc = "Chec[K] time" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Right" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent Left" })

vim.keymap.set("n", "]<space>", "m`o<esc>``", { desc = "Put Blank line Below" })
vim.keymap.set("n", "[<space>", "m`O<esc>``", { desc = "Put Blank line Above" })

vim.keymap.set("n", "]p", "o<esc>p", { desc = "Paste Below" })
vim.keymap.set("n", "[p", "O<esc>p", { desc = "Paste Above" })

vim.keymap.set("n", "]t", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "[t", "<cmd>tabprev<cr>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader>To", "<cmd>tabnew<cr>", { desc = "[T]ab [O]pen" })
vim.keymap.set("n", "<leader>Tc", "<cmd>tabclose<cr>", { desc = "[T]ab [C]lose" })

vim.keymap.set("n", "]q", "<cmd>cnext<cr>", { desc = "Next [Q]uickfix Item" })
vim.keymap.set("n", "[q", "<cmd>cprev<cr>", { desc = "Previous [Q]uickfix Item" })

vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!"<CR>')

vim.keymap.set("i", "<C-j>", "<DOWN>")
vim.keymap.set("i", "<C-k>", "<UP>")
vim.keymap.set("i", "<C-h>", "<LEFT>")
vim.keymap.set("i", "<C-l>", "<RIGHT>")
vim.keymap.set("i", "<C-;>", "<BS>")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>tf", "<cmd>ToggleBufferFormatOnSave<cr>", { desc = "[T]oggle buffer [F]ormat on save" })
vim.keymap.set("n", "<leader>tF", "<cmd>ToggleFormatOnSave<cr>", { desc = "[T]oggle global [F]ormat on save" })
vim.keymap.set("n", "<leader>td", function()
  local enabledString = ""
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
  if vim.diagnostic.is_enabled() then
    enabledString = "ENABLED"
  else
    enabledString = "DISABLED"
  end

  print("Vim Diagnostics: " .. enabledString)
end, { desc = "[t]oggle [d]iagnostics" })

vim.keymap.set("n", "dh", function()
  local current_diffopt = vim.o.diffopt
  vim.cmd("set diffopt&")
  vim.cmd("diffget /2")
  vim.cmd("set diffopt=" .. current_diffopt)
  vim.cmd("diffupdate")
end, { desc = "Get Current Change" })

vim.keymap.set("n", "dl", function()
  local current_diffopt = vim.o.diffopt
  vim.cmd("set diffopt&")
  vim.cmd("diffget /3")
  vim.cmd("set diffopt=" .. current_diffopt)
  vim.cmd("diffupdate")
end, { desc = "Get Incoming Change" })

vim.keymap.set("i", "<C-u>", function() end)
