local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
    print("treesitter configs NOT ok")
    return
end

configs.setup({
    -- list of parser names, or "all"
    ensure_installed = {
        "help",
        "javascript",
        "lua",
        "typescript",
    },
    -- install languages synchronously?
    sync_install = false,
    -- enable the extention?
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    -- rainbow parentheses configuration
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
})
