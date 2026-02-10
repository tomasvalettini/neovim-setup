local M = {}
local lspconfig = require("lspconfig")

M.setup = function (on_attach)
    lspconfig.lua_ls.setup({
        on_attach = on_attach,
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server to use LuaJIT (Neovim’s Lua)
                    version = "LuaJIT",
                },
                diagnostics = {
                    globals = { "vim" }, -- Avoid “vim is undefined”
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    })
end

return M

