return {
  -- UI
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Treesitter for syntax
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Telescope (file finder)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("config.telescope")
    end,
  },

  -- LSP + Mason + Autocomplete
  { "neovim/nvim-lspconfig" },

  -- Flutter / Dart
  {
    "nvim-flutter/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = true,
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "lua_ls" },
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
  },

  -- Snippets (needed by completion)
  {
    "L3MON4D3/LuaSnip",
  },

  -- AI coding agent
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      interactions = {
        chat = {
          adapter = "cline_cli",
        },
      },
    },
  },
}

