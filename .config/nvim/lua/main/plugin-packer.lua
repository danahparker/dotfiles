-- Automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer. Close and re-open Neovim please!")
    vim.cmd([[packadd packer.nvim]])
end

-- If packer isn't working properly, exit early
local ok, packer = pcall(require, "packer")
if not ok then
    print("plugin-packer NOT ok")
    return
end

-- Have packer use a popup window instead of a sidebar
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    -- Packer --
    use("wbthomason/packer.nvim") -- nvim pluging package manager

    -- File access --
    use("theprimeagen/harpoon") -- add files to quick-access list/binds
    use("nvim-lua/popup.nvim")   -- useful lua functions used by many plugins
    use("nvim-lua/plenary.nvim") -- useful lua functions used by many plugins

    -- Telescope --
    use("nvim-telescope/telescope.nvim") -- file searcher
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    }) -- fzf with telescope, TODO doesn't work for me atm

    -- Treesitter --
    use("nvim-treesitter/nvim-treesitter", { run = ':TSUpdate' }) -- syntax highlighting + required for telescope
    use("p00f/nvim-ts-rainbow") -- rainbow paranthesis (requires treesitter)
    use("romgrk/nvim-treesitter-context") -- TODO install these when internet isn't bad

    -- Git --
    use("lewis6991/gitsigns.nvim") -- see git highlights on LHS

    -- Autocomplete --
    use("hrsh7th/nvim-cmp") -- the completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-nvim-lsp")

    -- Snippets --
    use("L3MON4D3/LuaSnip") -- snippet engine for nvim-cmp
    use("rafamadriz/friendly-snippets") -- snippets

    -- LSP (must come after autocomplete plugins) --
    use { -- must be in order 1) mason 2) mason-lspconfig 3) nvim-lspconfig
        "williamboman/mason.nvim", -- LSP manager
        "williamboman/mason-lspconfig.nvim", -- required for mason
        "neovim/nvim-lspconfig" -- required for LSP
    }
    use("mfussenegger/nvim-dap") -- "Debug Adapter Protocol", recommends for mason
    use("jose-elias-alvarez/null-ls.nvim") -- formatting, linting, diagnostics

    -- Color schemes --
    use("tanvirtin/monokai.nvim") -- based colorscheme

    -- Makes life better --
    use("nvim-tree/nvim-tree.lua") -- file tree
    use("machakann/vim-sandwich") -- use motions to surround text with e.g. () {} '' "" etc
    use("tpope/vim-commentary") -- gc keybind to comment
    use("windwp/nvim-autopairs") -- auto completes () {} [] etc
    use("akinsho/toggleterm.nvim") -- terminal in vim
    use("ThePrimeagen/vim-be-good") -- vim practice when im bored
    use({ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, }) -- markdown preview
    use("rizzatti/dash.vim") -- :Dash command launches Dash against word under cursor
    use("windwp/nvim-ts-autotag") -- auto close tags

    -- Keep this chunk after importing plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
