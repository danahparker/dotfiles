local _, ui = pcall(require, "harpoon.ui")
local ok, mark = pcall(require, "harpoon.mark")
if not ok then
    print("harpoon NOT ok")
    return
end

local nnoremap = require("main.vim-keymap").nnoremap

nnoremap("<leader>a", function() mark.add_file() end)
nnoremap("<C-e>", function() ui.toggle_quick_menu() end)
nnoremap("<C-v>", function() ui.nav_file(1) end)
nnoremap("<C-b>", function() ui.nav_file(2) end)
nnoremap("<C-n>", function() ui.nav_file(3) end)
nnoremap("<C-m>", function() ui.nav_file(4) end)
