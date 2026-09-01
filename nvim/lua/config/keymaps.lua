vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>e", ":Lex<CR>:vertical resize 40<CR>")

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gI", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down and center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up and center cursor" })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		vim.lsp.buf.code_action({
			context = { only = { "source.organizeImports" } },
			apply = true,
		})
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.dart" },
  callback = function()
    vim.lsp.buf.format({
      async = false,
    })
  end,
})

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
	desc = "LSP Code Action",
})

vim.keymap.set("n", ">", vim.diagnostic.goto_next)
vim.keymap.set("n", "<", vim.diagnostic.goto_prev)

-- Cline / CodeCompanion
vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionChat<CR>", {
  desc = "Cline Chat",
})

vim.keymap.set("v", "<leader>cc", "<cmd>CodeCompanionChat<CR>", {
  desc = "Cline Chat with selection",
})

