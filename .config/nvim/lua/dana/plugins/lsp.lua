return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- manual lsp setup
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = true,
  },

  -- snippets
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
  },

  -- auto-completion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      local lsp_zero = require 'lsp-zero'
      lsp_zero.extend_cmp()
      local cmp = require 'cmp'
      local cmp_action = lsp_zero.cmp_action()

      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup {
        formatting = lsp_zero.cmp_format { details = true },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
        mapping = cmp.mapping.preset.insert {
          ['<CR>'] = cmp.mapping.confirm { select = false },
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      }
    end,
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    --- if you want to know more about lsp-zero and mason.nvim
    --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
    config = function()
      local lsp_zero = require 'lsp-zero'
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set('n', 'gd', function()
          vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set('n', 'K', function()
          vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set('n', '<leader>vws', function()
          vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set('n', '<leader>vd', function()
          vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set('n', '[d', function()
          vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set('n', ']d', function()
          vim.diagnostic.goto_prev()
        end, opts)
        vim.keymap.set('n', '<leader>vca', function()
          vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set('n', '<leader>vrr', function()
          vim.lsp.buf.references()
        end, opts)
        vim.keymap.set('n', '<leader>vrn', function()
          vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set('i', '<C-h>', function()
          vim.lsp.buf.signature_help()
        end, opts)
      end)

      require('mason-lspconfig').setup {
        handlers = {
          -- default handler
          function(server_name)
            local opts = { buffer = bufnr, remap = false }
            require('lspconfig')[server_name].setup {}
          end,
          -- lua handler
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
          -- typescript handler
          ts_ls = function()
            require('lspconfig').tsserver.setup {
              filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'typescript.tsx' },
              cmd = { 'typescript-language-server', '--stdio' },
            }
          end,
        },
      }
    end,
  },
}
