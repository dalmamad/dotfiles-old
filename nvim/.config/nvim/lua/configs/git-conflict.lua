require('git-conflict').setup(
  {
    default_mappings = false, -- disable buffer local mapping created by this plugin
    default_commands = true, -- disable commands created by this plugin
    disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
    highlights = { -- They must have background color, otherwise the default color will be used
      incoming = 'DiffText',
      current = 'DiffAdd',
    }
  }
)

vim.keymap.set('n', '<leader>go', '<Plug>(git-conflict-ours)')
vim.keymap.set('n', '<leader>gt', '<Plug>(git-conflict-theirs)')
vim.keymap.set('n', '<leader>gb', '<Plug>(git-conflict-both)')
vim.keymap.set('n', '<leader>g0', '<Plug>(git-conflict-none)')
vim.keymap.set('n', ']c', '<Plug>(git-conflict-prev-conflict)')
vim.keymap.set('n', '[c', '<Plug>(git-conflict-next-conflict)')

--[[
commands
GitConflictChooseOurs — Select the current changes.
GitConflictChooseTheirs — Select the incoming changes.
GitConflictChooseBoth — Select both changes.
GitConflictChooseNone — Select none of the changes.
GitConflictNextConflict — Move to the next conflict.
GitConflictPrevConflict — Move to the previous conflict.
GitConflictListQf — Get all conflict to quickfix

mapping
vim.keymap.set('n', 'co', '<Plug>(git-conflict-ours)')
vim.keymap.set('n', 'ct', '<Plug>(git-conflict-theirs)')
vim.keymap.set('n', 'cb', '<Plug>(git-conflict-both)')
vim.keymap.set('n', 'c0', '<Plug>(git-conflict-none)')
vim.keymap.set('n', ']x', '<Plug>(git-conflict-prev-conflict)')
vim.keymap.set('n', '[x', '<Plug>(git-conflict-next-conflict)')


autocommand
vim.api.nvim_create_autocommand('User', {
  pattern = 'GitConflictDetected',
  callback = function()
    vim.notify('Conflict detected in '..vim.fn.expand('<afile>'))
    vim.keymap.set('n', 'cww', function()
      engage.conflict_buster()
      create_buffer_local_mappings()
    end)
  end
})
--]]
