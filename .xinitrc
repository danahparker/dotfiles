exec zsh &
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/pipewire-media-session &
exec dunst &
exec picom &
exec mpd &
exec dwm
systemctl --user start pipewire
systemctl --user start wireplumber
