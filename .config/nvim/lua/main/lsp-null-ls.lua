local ok, null_ls = pcall(require, "null-ls")
if not ok then
    print("null-ls NOT ok")
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier,
        formatting.black.with({ extra_args = { "--fast" }, line_length = 79 }),
        --formatting.stylua,
    },
})

local nnoremap = require("main.vim-keymap").nnoremap
local lsp_ok, _ = pcall(require, "lspconfig")
if not lsp_ok then
    print("null-ls: lspconfig NOT ok")
    return
end
nnoremap("<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>")
