local M = {}
local lspconfig = require("lspconfig")

M.setup = function(on_attach)
  vim.filetype.add({
    extension = {
      asm = 'asm',
      s = 'asm',
      z80 = 'asm',
      inc = 'asm',
    }
  })

  lspconfig.asm_lsp.setup({
    on_attach = on_attach,
    cmd = { "asm-lsp" },
    filetypes = { "asm", "vmasm" },
  })
end

return M
