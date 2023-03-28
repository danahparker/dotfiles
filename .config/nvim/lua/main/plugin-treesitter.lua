local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
    print("treesitter configs NOT ok")
    return
end

configs.setup({
    -- regular configuration --
    ensure_installed = "all", -- one of "all", "maintained" (parsers w/ maintainers), or a list of languages
    sync_install = false, -- install languages synchronously?
    ignore_install = {""}, -- list of parsers to ignore installing
    highlight = {
        enable = true, -- enable the extention?
        disable = {""}, -- list of languages that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true, -- keeps your cursor at indentation level you expect
        disable = {"yaml"}, -- list of languages that auto-intendation will disabled
    },
    -- rainbow parentheses configuration
    rainbow = {
        enable = true, -- enable rainbow parentheses
        disable = {""}, -- list of languages you don't want rainbow parantheses for
        extended_mode = true, -- also highlight non-bracket delimiters (e.g. html tags, boolean)
        max_file_lines = nil, -- od not enable for files with more than n lines (int)
        -- colors = {}, -- table of hex strings
        -- termcolors = {}, -- table of color name strings
    },
})
