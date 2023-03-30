local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
local plugins = {
    "wbthomason/packer.nvim",                   -- packer: nvim pluging package manager
    "theprimeagen/harpoon",                     -- file access: add files to quick-access list/binds
    "nvim-lua/popup.nvim",                      -- file access: useful lua functions used by many plugins
    "nvim-lua/plenary.nvim",                    -- file access: useful lua functions used by many plugins
    "nvim-telescope/telescope.nvim",            -- file access: file searcher
    "nvim-telescope/telescope-fzf-native.nvim", -- file access: fzf with telescope
    "nvim-treesitter/nvim-treesitter",          -- treesitter: syntax highlighting + required for telescope
    "romgrk/nvim-treesitter-context",           -- treesitter: more treesitter
    "p00f/nvim-ts-rainbow",                     -- treesitter: rainbow paranthesis (requires treesitter)
    "lewis6991/gitsigns.nvim",                  -- git: see git highlights on LHS
    "hrsh7th/nvim-cmp",                         -- autocomplete: main plugin
    "hrsh7th/cmp-buffer",                       -- autocomplete: buffer completions
    "hrsh7th/cmp-path",                         -- autocomplete: path completions
    "hrsh7th/cmp-nvim-lsp",                     -- autocomplete: LSP compatability
    "L3MON4D3/LuaSnip",                         -- snippets: snippet engine for nvim-cmp
    "rafamadriz/friendly-snippets",             -- snippets: some out-of-the-box snippets
    "williamboman/mason.nvim",                  -- LSP: manager
    "williamboman/mason-lspconfig.nvim",        -- LSP: required for mason
    "neovim/nvim-lspconfig",                    -- LSP: required for LSP
    "mfussenegger/nvim-dap",                    -- LSP: "Debug Adapter Protocol", recommended for mason
    "jose-elias-alvarez/null-ls.nvim",          -- LSP: formatting, linting, diagnostics
    "mfussenegger/nvim-jdtls",                  -- LSP: java language server
    "tanvirtin/monokai.nvim",                   -- etc: based colorscheme
    "nvim-tree/nvim-tree.lua",                  -- etc: file tree
    "nvim-tree/nvim-web-devicons",              -- etc: display icons in nvim-tree
    "machakann/vim-sandwich",                   -- etc: use motions to surround text with e.g. () {} '' "" etc
    "tpope/vim-commentary",                     -- etc: gc keybind to comment
    "windwp/nvim-autopairs",                    -- etc: auto completes () {} [] etc
    "akinsho/toggleterm.nvim",                  -- etc: terminal in vim :O
    "ThePrimeagen/vim-be-good",                 -- etc: vim practice when im bored
    "iamcco/markdown-preview.nvim",             -- etc: markdown previewer via :Markdown* commands
    "rizzatti/dash.vim",                        -- etc: use :Dash command launches Dash against word under cursor
    "windwp/nvim-ts-autotag",                   -- etc: auto close HTML tags
    "alexghergh/nvim-tmux-navigation",          -- etc: allow 'control + h/j/k/l' for tmux pane navigation
    "nvim-lualine/lualine.nvim",                -- etc: cool looking powerline
}
local opts = {}
require("lazy").setup(plugins, opts)
