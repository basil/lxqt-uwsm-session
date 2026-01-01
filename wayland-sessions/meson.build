wayland_sessions = [
  'lxqt-hyprland-uwsm.desktop',
  'lxqt-kwin-wayland-uwsm.desktop',
  'lxqt-labwc-uwsm.desktop',
  'lxqt-miriway-uwsm.desktop',
  'lxqt-niri-uwsm.desktop',
  'lxqt-river-uwsm.desktop',
  'lxqt-sway-uwsm.desktop',
  'lxqt-wayfire-uwsm.desktop',
]

foreach session : wayland_sessions
  install_data(
    session,
    install_dir: WAYLAND_SESSIONS_DIR,
    install_mode: 'rw-r--r--',
  )
endforeach
