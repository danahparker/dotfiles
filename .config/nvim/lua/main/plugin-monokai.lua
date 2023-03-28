local ok, monokai = pcall(require, "monokai")
if not ok then
    print("monokai NOT ok")
    vim.cmd("colorscheme desert")
    return
end

local palette = monokai.classic
monokai.setup({
    custom_hlgroups = {
        LineNr = {
            fg = palette.yellow
        },
        Search = {
            bg = palette.pink,
            fg = palette.black
        }
    }
})
