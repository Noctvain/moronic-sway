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
        ensure_installed = { "lua_ls", "tsserver" }, -- Note: "ts_ls" was corrected to "tsserver"
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Define configurations using vim.lsp.config
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

      vim.lsp.config('tsserver', { -- Note: "ts_ls" was corrected to "tsserver"
        capabilities = capabilities,
        filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
      })

      -- Enable the configs
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('html')
      vim.lsp.enable('tsserver')

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
