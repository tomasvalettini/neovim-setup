vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = "●", -- or "▎", "■", "", etc.
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
