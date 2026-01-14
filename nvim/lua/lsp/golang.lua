local M = {}
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.setup = function(on_attach)
  lspconfig.gopls.setup({
    on_attach = on_attach,

    capabilities = cmp_nvim_lsp.default_capabilities(),

    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          unusedwrite = true,
        },
        staticcheck = true,
      },
    },
  })

  -- Format Go files on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
      vim.lsp.buf.format({ async = false })
    end,
  })
end

return M

