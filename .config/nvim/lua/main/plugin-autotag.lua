local ok, autotag = pcall(require, 'nvim-ts-autotag')
if not ok then
    print('autotag NOT ok')
    return
end

autotag.setup({
    autotag = {
        enable = true
    }
})
