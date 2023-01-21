require("debugprint").setup({
  move_to_debugline = true,
  create_keymaps = false,
  create_commands = false
})

vim.keymap.set("n", "<Leader>d", function()
  -- Note: setting `expr=true` and returning the value are essential
  return require('debugprint').debugprint({})
end, {
    expr = true,
  })

-- vim.keymap.set("n", "g?d", function()
--   require("debugprint").deleteprints()
-- end)
-- vim.keymap.set("n", "<Leader>d", function()
--     require('debugprint').debugprint()
-- end)
-- vim.keymap.set("n", "<Leader>D", function()
--     require('debugprint').debugprint({ above = true })
-- end)
-- vim.keymap.set("n", "<Leader>dq", function()
--     require('debugprint').debugprint({ variable = true })
-- end)
-- vim.keymap.set("n", "<Leader>Dq", function()
--     require('debugprint').debugprint({ above = true, variable = true })
-- end)
-- vim.keymap.set("n", "<Leader>dq", function()
--   require('debugprint').debugprint({ignore_treesitter = true, variable = true})
-- end)
-- vim.keymap.set("n", "<Leader>dq", function()
-- require('debugprint').debugprint({ignore_treesitter = true, above = true, variable = true})
-- end)
--
-- vim.keymap.set("n", "g?d", function()
--     require('debugprint').deleteprints()
-- end)
