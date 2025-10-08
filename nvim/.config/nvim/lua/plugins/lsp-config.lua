return {
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
        ensure_installed = { "lua_ls", "ts_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        filetypes = { 'lua' },
        -- Optional: Add server-specific settings here
        -- settings = { ... }
      })

      vim.lsp.config('html', {
        capabilities = capabilities,
        filetypes = { 'html' },
      })

      vim.lsp.config('ts_ls', {
        capabilities = capabilities,
        filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
      })

      -- Enable the configs
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('html')
      vim.lsp.enable('ts_ls')

      -- Set up keymaps after LSP attaches to a buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Buffer-local mappings for LSP functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        end,
      })
    end
  },
}
