require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          home = "~/notes/code/",
        },
      },
    },
    ["core.integrations.nvim-cmp"] = {},
    ["core.norg.completion"] = {
      config = { engine = "nvim-cmp" },
    },
    ["core.norg.concealer"] = {
      config = {
        enabled = true,
        adaptive = true,
        conceal = true,
        folds = false,
      },
    },
    ["core.fs"] = {
      config = {},
    },
    ["core.integrations.telescope"] = {},
    ["core.export"] = {}
  },
})

-- temporary
local today = os.date("%Y-%m-%d")
local time = os.date("%H:%M")
local function find_date()
  require'telescope.builtin'.live_grep({default_text = today})
end
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<space>fd",find_date, opts)
vim.keymap.set("n", "<space>is","o[time.start "..today.."]<esc>", opts)
vim.keymap.set("n", "<space>id","o[time.deadline "..today.."]<esc>", opts)
vim.keymap.set("n", "<space>d","F-f[lrx", opts)
