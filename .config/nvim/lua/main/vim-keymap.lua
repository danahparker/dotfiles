-- Provides functions to do remaps

M = {}

local function bind(op, outer_opts)
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend(
            "force",
            outer_opts or {noremap = true},
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind("n", {noremap=false})
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")

local nnoremap = M.nnoremap
local vnoremap = M.vnoremap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal-mode binds -- 
-- Various commands
--
nnoremap("<leader>dl", "<cmd>Ex<CR>") -- Open directory listing
nnoremap("<leader>h", "<cmd>noh<CR>") -- Stop highlighting search word
nnoremap("<leader>w", "<cmd>w<CR>")   -- Save file
nnoremap("<leader>bd", "<cmd>bd<CR>") -- Close current buffer
nnoremap("<C-d>", "<C-d>zz")          -- Keep cursor centered when using Ctrl + d
nnoremap("<C-u>", "<C-u>zz")          -- Keep cursor centered when using Ctrl + u

-- Visual-mode binds --
-- Stay in indent mode
vnoremap("<", "<gv")
vnoremap(">", ">gv")

return M
