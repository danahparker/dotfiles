local mason_ok, mason = pcall(require, "mason")

if not mason_ok then
    print("mason NOT ok")
    return
end

local mason_lsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
    print("mason-lspconfig NOT ok")
    return
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
    print("lspconfig NOT ok")
    return
end

-- Mason setup
mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- Mason LSP setup
mason_lspconfig.setup({
    ensure_installed = {
        "bashls",
        "cucumber_language_server",
        "eslint",
        "graphql",
        "html",
        "jdtls",
        "jsonls",
        "marksman",
        "lua_ls",
        "pyright",
        "ruby_ls",
        "rust_analyzer",
        "tsserver",
        "vimls",
    }
})

-- On Attach -> LSP Keybindings
local M = {}
-- local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp")
-- if not cmp_ok then
--     print("lsp-mason: cmp_nvim_lsp NOT ok")
-- end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
-- M.capabilities = cmp.default_capabilities(M.capabilities)

M.setup = function()
    local config = {
        virtual_text = false,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }
    vim.diagnostic.config(config)
end

local function lsp_keymaps(bufnr)
    local opts = {
        noremap = true,
        silent = true,
    }
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
    keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
    keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
    keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    keymap(bufnr, "n", "<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    keymap(bufnr, "n", "<leader>ca", "<cmd> lua vim.lsp.buf.code_action()<CR>", opts)
    vim.cmd [[ command! Format execute vim.lsp.buf.formatting() ]]
end

M.on_attach = function(_, bufnr)
	lsp_keymaps(bufnr)
end

lspconfig.bashls.setup({ on_attach = M.on_attach })
lspconfig.cucumber_language_server.setup({ on_attach = M.on_attach })
lspconfig.eslint.setup({ on_attach = M.on_attach })
lspconfig.graphql.setup({ on_attach = M.on_attach })
lspconfig.html.setup({ on_attach = M.on_attach })
-- lspconfig.jdtls.setup({ on_attach = M.on_attach })
lspconfig.jsonls.setup({ on_attach = M.on_attach })
lspconfig.lua_ls.setup({
    on_attach = M.on_attach,
    settings = {
        Lua = {
            globals = {'vim'}
        }
    }
})
lspconfig.marksman.setup({ on_attach = M.on_attach })
lspconfig.prismals.setup({ on_attach = M.on_attach })
lspconfig.pyright.setup({ on_attach = M.on_attach })
lspconfig.ruby_ls.setup({ on_attach = M.on_attach })
lspconfig.rust_analyzer.setup({ on_attach = M.on_attach })
lspconfig.tailwindcss.setup({ on_attach = M.on_attach })
lspconfig.tsserver.setup({ on_attach = M.on_attach })
lspconfig.vimls.setup({ on_attach = M.on_attach })

return M
