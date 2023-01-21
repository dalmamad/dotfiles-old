local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
-- fasdf  fasdf    asdf  asdf  asdf
dashboard.section.buttons.val = {
  dashboard.button("f", "   Find file", ":Telescope find_files<CR> | cd %:h<cr>"),
  dashboard.button("p", "   Projects", ":Telescope projects<CR>"),
  dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("s", "   Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR> | <cmd>NvimTreeToggle<cr>"),
  dashboard.button("n", " ﴬ  Notes", ":Neorg workspace home <cr> | :cd %:h <cr>"),
  -- dashboard.button("o", " ﴬ  Obsidian", ":cd ~/obsidian/home <cr> | :e ~/obsidian/home/this is n.md <cr>"),
  dashboard.button("q", "   Quit", ":qa<CR>"),
}

dashboard.config.opts.noautocmd = true
vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.config)
