local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = 15,
  open_mapping = [[<C-\>]],
  hide_numbers = false,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = false,
  insert_mappings = true,
  persist_size = false,
  direction = "horizontal",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  -- Press <Esc> to exit terminal mode
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', 'jj', [[<C-\><C-n>]], opts)

  -- Better terminal navigation
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)

  -- Better terminal resize
  vim.api.nvim_buf_set_keymap(0, "t", "<CA-k>", [[<C-\><C-N>:resize -2<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<CA-j>", [[<C-\><C-N>:resize +2<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<CA-h>", [[<C-\><C-N>:vertical resize -2<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<CA-l>", [[<C-\><C-N>:vertical resize +2<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  --   hidden = true ,
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    -- disable Esc for lazygit - conflict with lazygit
    vim.api.nvim_buf_del_keymap(0, "t", "<esc>")
    vim.api.nvim_buf_set_keymap(0, "t", "<A-Esc>", [[<C-\><C-n>]], { noremap = true })

    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    -- enable Esc after closing lazygit
    vim.api.nvim_buf_del_keymap(0, "t", "<A-Esc>")
    vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", [[<C-\><C-n>]], { noremap = true })

    vim.cmd("startinsert!")
  end,
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE()
  node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _NCDU_TOGGLE()
  ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
  htop:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })

function _PYTHON_TOGGLE()
  python:toggle()
end
