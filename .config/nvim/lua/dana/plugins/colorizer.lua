-- plugin for highlighting hex colors
-- make sur eto have the following inside init.lua:
-- require('colorizer').setup()
vim.o.termguicolors = true -- required
return {
  'norcalli/nvim-colorizer.lua'
}
