sudo dnf install dbus-devel python3-appdirs python3-dbus
sudo dnf install git gcc gobject-introspection-devel cairo-gobject-devel pkg-config python3-devel gtk4 pipx && \
    [ $XDG_SESSION_TYPE = "wayland" ] && sudo dnf install gtk-layer-shell grim && \
    pipx ensurepath && \
    pipx install git+https://github.com/AlfredoSequeida/hints.git
