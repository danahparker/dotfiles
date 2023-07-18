-- Config file for nvim-treesitter plugin:
-- https://github.com/nvim-treesitter/nvim-treesitter
local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
    print("treesitter configs NOT ok")
    return
end

configs.setup({
    -- list of parser names: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
    -- or replace object with "all"
    ensure_installed = {
        "bash",
        "java",
        "javascript",
        "lua",
        "python",
        "tsx",
        "typescript",
        "vimdoc",
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
