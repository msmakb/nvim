require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Custom mapping
vim.api.nvim_set_keymap(
  "t",
  "<Esc>",
  "<C-\\><C-n>",
  { noremap = true, silent = true, desc = "Exit terminal insert mode" }
)
vim.api.nvim_set_keymap("i", "<C-z>", "<C-O>u", { noremap = true, silent = true, desc = "Undo in Insert Mode" })
vim.api.nvim_set_keymap("i", "<C-r>", "<C-O><C-r>", { noremap = true, silent = true, desc = "Redo in Insert Mode" })
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true, desc = "Select all" })

vim.api.nvim_set_keymap(
  "i",
  "<S-Right>",
  "<C-o>ve",
  { noremap = true, silent = true, desc = "Select words from insert mode" }
)
vim.api.nvim_set_keymap(
  "i",
  "<S-Left>",
  "<C-o>vb",
  { noremap = true, silent = true, desc = "Select words from insert mode" }
)
vim.api.nvim_set_keymap(
  "i",
  "<S-Down>",
  "<C-o>vj",
  { noremap = true, silent = true, desc = "Select lines from insert mode" }
)
vim.api.nvim_set_keymap(
  "i",
  "<S-Up>",
  "<C-o>vk",
  { noremap = true, silent = true, desc = "Select lines from insert mode" }
)

map("n", "<C-z>", "<Nop>", { desc = "Do nothing for Ctrl+Z" })

map("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "LSP: Rename symbol" })
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })

map("n", "<A-Up>", ":m .-2<CR>==") -- move line down(n)
map("n", "<A-Down>", ":m .+1<CR>==") -- move line up(n)
map("v", "<A-Up>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-Down>", ":m '<-2<CR>gv=gv") -- move line down(v)
map("n", "<C-Down>", "<C-d>", { noremap = true, silent = true })
map("n", "<C-Up>", "<C-u>", { noremap = true, silent = true })

-- Hotkey to manually trigger a Copilot suggestion
map("i", "<C-\\>", function()
  require("copilot.suggestion").next()
end, { desc = "Copilot: Next suggestion" })

-- LSP mappings
map("n", "K", vim.lsp.buf.hover, { desc = "LSP: Show hover information" })
map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
map("n", "<leader>gr", vim.lsp.buf.references, { desc = "LSP: Show references" })
map("n", "<leader>gf", vim.lsp.buf.format, { desc = "LSP: Format document" })
-- map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename symbol" })

-- Code Action
map("n", "<leader>cp", ":Copilot fix<CR>", { silent = true })
map({ "n", "x" }, "<leader>ca", function()
  require("tiny-code-action").code_action()
end, { noremap = true, silent = true, desc = "Code Action" })
map("n", "<leader>cp", ":Copilot fix<CR>", { silent = true })

-- Tmux mappings
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true })
map("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true })
map("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true })
