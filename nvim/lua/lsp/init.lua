local M = {}

M.on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  local keymap = vim.keymap.set

  -- LSP navigation
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)

  -- Hover docs
  keymap("n", "K", vim.lsp.buf.hover, opts)

  -- Rename symbol
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

  -- Code actions
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  -- Format buffer
  keymap("n", "<leader>fm", function()
    vim.lsp.buf.format { async = true }
  end, opts)

  keymap("n", "gl", vim.diagnostic.open_float, opts)
  keymap("n", "[d", vim.diagnostic.goto_prev, opts)
  keymap("n", "]d", vim.diagnostic.goto_next, opts)
end

-- Load language-specific servers
require("lsp.golang").setup(M.on_attach)
require("lsp.cmp")

return M

