-- Packer bootstrapping
-- https://github.com/wbthomason/packer.nvim#bootstrapping
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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
    use("wbthomason/packer.nvim") -- packer: nvim pluging package manager
    use("theprimeagen/harpoon")   -- file access: add files to quick-access list/binds
    use("nvim-lua/popup.nvim")    -- file access: useful lua functions used by many plugins
    use("nvim-lua/plenary.nvim")  -- file access: useful lua functions used by many plugins
    use("nvim-telescope/telescope.nvim") -- file access: file searcher
    use({ -- fzf with telescope
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    })
    use("nvim-treesitter/nvim-treesitter", { run = ':TSUpdate' }) -- treesitter: syntax highlighting + required for telescope
    use("romgrk/nvim-treesitter-context") -- treesitter: more treesitter
    use("p00f/nvim-ts-rainbow")    -- treesitter: rainbow paranthesis (requires treesitter)
    use("lewis6991/gitsigns.nvim") -- git: see git highlights on LHS
    use("hrsh7th/nvim-cmp")     -- autocomplete: main plugin
    use("hrsh7th/cmp-buffer")   -- autocomplete: buffer completions
    use("hrsh7th/cmp-path")     -- autocomplete: path completions
    use("hrsh7th/cmp-nvim-lsp") -- autocomplete: LSP compatability
    use("L3MON4D3/LuaSnip")     -- snippets: snippet engine for nvim-cmp
    use("rafamadriz/friendly-snippets") -- snippets: some out-of-the-box snippets
    use {
        "williamboman/mason.nvim",           -- LSP: manager
        "williamboman/mason-lspconfig.nvim", -- LSP: required for mason
        "neovim/nvim-lspconfig"              -- LSP: required for LSP
    }
    use("mfussenegger/nvim-dap")           -- LSP: "Debug Adapter Protocol", recommended for mason
    use("jose-elias-alvarez/null-ls.nvim") -- LSP: formatting, linting, diagnostics
    use("tanvirtin/monokai.nvim")          -- etc: based colorscheme
    use("nvim-tree/nvim-tree.lua")         -- etc: file tree
    use("nvim-tree/nvim-web-devicons")     -- etc: display icons in nvim-tree
    use("machakann/vim-sandwich")          -- etc: use motions to surround text with e.g. () {} '' "" etc
    use("tpope/vim-commentary")            -- etc: gc keybind to comment
    use("windwp/nvim-autopairs")           -- etc: auto completes () {} [] etc
    use("akinsho/toggleterm.nvim")         -- etc: terminal in vim :O
    use("ThePrimeagen/vim-be-good")        -- etc: vim practice when im bored
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end, -- etc: markdown preview
    })
    use("rizzatti/dash.vim")              -- etc: use :Dash command launches Dash against word under cursor
    use("windwp/nvim-ts-autotag")         -- etc: auto close HTML tags
    use("christoomey/vim-tmux-navigator") -- etc: allow 'control + h/j/k/l' for tmux pane navigation
    use("nvim-lualine/lualine.nvim")      -- etc: cool looking powerline

    -- Bootstrap packer
    if packer_bootstrap then
        packer.sync()
    end
end)
