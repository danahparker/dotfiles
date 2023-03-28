local ok, telescope = pcall(require, "telescope")
if not ok then
    print("telescope NOT ok")
    return
end

local nnoremap = require("main.vim-keymap").nnoremap

telescope.setup()
--require("telescope").load_extension("fzf") -- doesn't work right now for some reason

nnoremap("<C-p>", function() require("telescope.builtin").git_files() end)
nnoremap("<C-f>", function() require("telescope.builtin").find_files() end)
