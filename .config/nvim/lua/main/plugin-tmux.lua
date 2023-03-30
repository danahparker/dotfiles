local ok, tmux = pcall(require, "nvim-tmux-navigation")
if not ok then
    print("tmux navigator NOT ok")
    return
end

tmux.setup({
    disable_when_zoomed = true,
    keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
    }
})
