local options = {
    tabstop = 4,            -- number of spaces that a tab in the file counts for.
    softtabstop = 4,        -- number of spaces that a tab counts for while performing editing
    shiftwidth = 4,         -- number of spaces inserted per tab
    expandtab = true,       -- convert tabs to spaces?
    smartindent = true,     -- make indent smarter?
    wrap = false, 	        -- visual line wrapping?
    number = true,          -- line numbers?
    relativenumber = true,  -- show number of lines from cursor?
    swapfile = false,       -- write swap files?
    backup = false,         -- write backup files?
    hlsearch = true,        -- highlight search matches?
    incsearch = true,       -- jump to next logical match when typing search string?
    ignorecase = true,      -- case insensitive search
    smartcase = true,       -- when ignorecase is set, /The would find only "The", while /the would find "the" or "The"
    updatetime = 50,        -- setting for performance
    clipboard = "unnamed",  -- allow vim to access system clipboard
    termguicolors = true,   -- allow vim to have more colors?
    mouse = "",             -- disable mouse
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
