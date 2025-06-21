[ ! -s ~/.config/mpd/pid ] && mpd
[ -s /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh
systemctl --user start pipewire
systemctl --user start wireplumber
/usr/bin/pipewire
/usr/bin/pipewire-pulse
/usr/bin/pipewire-media-session
