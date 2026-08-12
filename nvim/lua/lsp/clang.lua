local M = {}
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.setup = function(on_attach)
  lspconfig.clangd.setup({
    on_attach = on_attach,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
    },
    init_options = {
        fallbackFlags = { "-std=c11" },
    },
  })
end

return M

