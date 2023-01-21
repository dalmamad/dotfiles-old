vim.o.winwidth = 2
vim.o.winminwidth = 2
vim.o.equalalways = false
require("windows").setup({
  autowidth = { --		       |windows.autowidth|
    enable = false,
    winwidth = 5, --		        |windows.winwidth|
    filetype = { --	      |windows.autowidth.filetype|
      help = 2,
    },
  },
  ignore = { --			  |windows.ignore|
    buftype = { "quickfix" },
    filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
  },
  animation = {
    enable = false,
    duration = 300,
    fps = 30,
    easing = "in_out_sine",
  },
})

local function cmd(command)
  return table.concat({ "<Cmd>", command, "<CR>" })
end

vim.keymap.set("n", "<leader>z", cmd("WindowsMaximize"))
vim.keymap.set("n", "<C-w>_", cmd("WindowsMaximizeVertically"))
vim.keymap.set("n", "<C-w>|", cmd("WindowsMaximizeHorizontally"))
vim.keymap.set("n", "<C-w>=", cmd("WindowsEqualize"))
