
-- Regular VIM
require("main.vim-keymap");
require("main.vim-settings");

-- Plugins
require("main.plugin-lazy");
require("main.plugin-telescope");
require("main.plugin-harpoon");
require("main.plugin-monokai")
require("main.plugin-autocomplete")
require("main.plugin-autopairs")
require("main.plugin-treesitter")
require("main.plugin-gitsigns")
require("main.plugin-toggleterm")
require("main.plugin-tree")
require("main.plugin-autotag")
require("main.plugin-lualine")
require("main.plugin-tmux")

-- LSP
require("main.lsp-mason")
require("main.lsp-null-ls")
require("main.lsp-jdtls")
