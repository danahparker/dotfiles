local tree_ok, tree = pcall(require, "nvim-tree")
if not tree_ok then
    print("nvim tree NOT ok")
    return
end

tree.setup({
    actions = {
        open_file = {
            resize_window = true
        }
    },
    view = {
        relativenumber = true,
        width = 30
    }
})

local nnoremap = require("main.vim-keymap").nnoremap

nnoremap("<leader>t", "<cmd>NvimTreeFindFileToggle<CR>")

require("nvim-tree.api").tree.close()
