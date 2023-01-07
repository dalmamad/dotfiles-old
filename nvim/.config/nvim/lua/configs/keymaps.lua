local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
--keymap("", "<Space>", "<Nop>", opts)
--vim.g.mapleader = " "
--vim.g.maplocalleader = " "

--Remap "," as leader key
vim.g.mapleader = ","
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Better resize
keymap("n", "<CA-k>", ":resize -2<CR>", opts)
keymap("n", "<CA-j>", ":resize +2<CR>", opts)
keymap("n", "<CA-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<CA-l>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

-- Better indent
-- keymap("n", ">", ">>", opts)
-- keymap("n", "<", "<<", opts)

-- Insert --
-- Press jj fast to exit insert mode
keymap("i", "jj", "<ESC>", opts)

-- Better window navigation
keymap("i", "<C-h>", "<Esc><C-w>h", opts)
keymap("i", "<C-k>", "<Esc><C-w>k", opts)
keymap("i", "<C-j>", "<Esc><C-w>j", opts)
keymap("i", "<C-l>", "<Esc><C-w>l", opts)

-- Bettei resize
keymap("i", "<CA-k>", "<Esc>:resize -2<CR>", opts)
keymap("i", "<CA-j>", "<Esc>:resize +2<CR>", opts)
keymap("i", "<CA-h>", "<Esc>:vertical resize -2<CR>", opts)
keymap("i", "<CA-l>", "<Esc>:vertical resize +2<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv=gv", opts)
keymap("x", "K", ":move '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)

-- Terminal --
-- Press <Esc> to exit terminal mode
-- keymap("t", "<Esc>", "<C-\\><C-N>", opts)

-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Better terminal resize
-- keymap("t", "<CA-k>", "<C-\\><C-N>:resize -2<CR>", opts)
-- keymap("t", "<CA-j>", "<C-\\><C-N>:resize +2<CR>", opts)
-- keymap("t", "<CA-h>", "<C-\\><C-N>:vertical resize -2<CR>", opts)
-- keymap("t", "<CA-l>", "<C-\\><C-N>:vertical resize +2<CR>", opts)
