require("rest-nvim").setup({
  -- Open request results in a horizontal split
  result_split_horizontal = false,
  -- Keep the http file buffer above|left when split horizontal|vertical
  result_split_in_place = false,
  -- Skip SSL verification, useful for unknown certificates
  skip_ssl_verification = false,
  -- Encode URL before making request
  encode_url = true,
  -- Highlight request on run
  highlight = {
    enabled = true,
    timeout = 150,
  },
  result = {
    -- toggle showing URL, HTTP info, headers at top the of result window
    show_url = true,
    show_http_info = true,
    show_headers = true,
    -- executables or functions for formatting response body [optional]
    -- set them to false if you want to disable them
    formatters = {
      json = "jq",
      html = function(body)
        return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
      end
    },
  },
  -- Jump to request line on run
  jump_to_request = false,
  env_file = '.env',
  yank_dry_run = true,

  -- Dynamic variables
  -- custom_dynamic_variables = {
  --   -- overwrite built-in`
  --   ['$uuid'] = function()
  --     return "{{$uuid}}"
  --   end,
  --   -- add new dynamic variable function`
  --   ["$date"] = function()
  --     local os_date = os.date('%Y-%m-%d')
  --     return os_date
  --   end,
  -- },
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>rr", "<cmd> lua require('rest-nvim').run()<cr>", opts)
vim.keymap.set('n', '<leader>rp', '<Plug>RestNvimPreview')
vim.keymap.set('n', '<leader>rl', '<Plug>RestNvimLast')
