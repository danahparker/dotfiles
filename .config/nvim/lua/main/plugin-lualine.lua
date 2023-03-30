local ok, lualine = pcall(require, "lualine")
if not ok then
    print ("lualine NOT ok")
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'wombat',
    },
})
