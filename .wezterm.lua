local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = 'Muse (terminal.sexy)' -- for dark
--config.color_scheme = 'Harmonic16 Light (base16)' -- for light

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 19

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.macos_window_background_blur = 1

config.keys = {
    {
        key = 'LeftArrow',
        mods = 'OPT',
        action = wezterm.action.SendString('\x1bb'),
    },
    {
        key = 'RightArrow',
        mods = 'OPT',
        action = wezterm.action.SendString('\x1bf'),
    },
    {
        key = 'Backspace',
        mods = 'OPT',
        action = wezterm.action.SendString('\x1b[3;5~'),
    },
}

return config
