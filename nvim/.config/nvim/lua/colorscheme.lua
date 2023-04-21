vim.cmd([[
try
  " colorscheme oxocarbon
  colorscheme darkplus
  colorscheme tokyonight-night
  colorscheme default
  colorscheme tokyonight-day
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
