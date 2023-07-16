local async_formatting = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  vim.lsp.buf_request(
    bufnr,
    "textDocument/formatting",
    vim.lsp.util.make_formatting_params({}),
    function(err, res, ctx)
      if err then
        local err_msg = type(err) == "string" and err or err.message
        -- you can modify the log message / level (or ignore it completely)
        vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
        return
      end

      -- don't apply results if buffer is unloaded or has been modified
      -- uncomment it if you wanted format on write
      -- if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
      --   return
      -- end

      if res then
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd("silent noautocmd update")
        end)
      end
    end
  )
end

local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local format = true
null_ls.setup({
  sources = {
    formatting.prettier.with({ extra_args = {"--no-semi"} }),
    formatting.black.with({ extra_args = { "--fast" } }),
    -- diagnostics.eslint_d,
    formatting.clang_format,
    formatting.csharpier,
    formatting.golines,
    formatting.rustfmt.with({ extra_args = {}}),
    -- formatting.stylua,
    -- diagnostics.flake8,
    -- diagnostics.selene,
  },
  debug = false,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      -- Format on write
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          if format then
            async_formatting(bufnr)
          end
        end,
      })
    end
  end,
})
local function toggle_auto_format()
  if format == false then
    format = true
  else
    format = false
  end
end
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>F", toggle_auto_format, opts)
-- vim.keymap.set("n", "<leader>F", async_formatting, opts)
