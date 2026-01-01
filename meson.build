project(
  'lxqt-uwsm-session',
  version: '0.1.0',
  license: 'MIT',
  meson_version: '>=1.3.0',
)

PKG_DATA_DIR = join_paths(
  get_option('prefix'),
  get_option('datadir'),
  meson.project_name(),
)
PKG_LIBEXEC_DIR = join_paths(
  get_option('prefix'),
  get_option('libexecdir'),
  meson.project_name(),
)
PKG_DOC_DIR = get_option('docdir')
if PKG_DOC_DIR == ''
  PKG_DOC_DIR = join_paths(
    get_option('prefix'),
    get_option('datadir'),
    'doc',
    meson.project_name(),
  )
endif
PKG_LICENSE_DIR = get_option('licensedir')
if PKG_LICENSE_DIR == ''
  PKG_LICENSE_DIR = join_paths(
    get_option('prefix'),
    get_option('datadir'),
    'licenses',
    meson.project_name(),
  )
endif
SD_USER_DIR = join_paths(
  get_option('prefix'),
  'lib/systemd/user'
)
WAYLAND_SESSIONS_DIR = join_paths(
  get_option('datadir'),
  'wayland-sessions'
)
UWSM_DIR = join_paths(
  get_option('datadir'),
  'uwsm'
)

systemd_user_units = [
  'lxqt-desktop.service',
  'lxqt-globalkeyshortcuts.service',
  'lxqt-notifications.service',
  'lxqt-panel.service',
  'lxqt-policykit-agent.service',
  'lxqt-powermanagement.service',
  'lxqt-runner.service',
  'lxqt-xscreensaver-autostart.service',
]

foreach unit : systemd_user_units
  install_data(
    join_paths('systemd', 'user', unit),
    install_dir: SD_USER_DIR,
    install_mode: 'rw-r--r--',
  )
endforeach

# NOTE: The override.conf files live in directories whose names contain a
# literal '\x2d'. Meson cannot handle backslashes in path components, so we
# install those via a separate install script instead of install_data().

compositor_units = [
  'lxqt-hyprland-uwsm.desktop',
  'lxqt-kwin-wayland-uwsm.desktop',
  'lxqt-labwc-uwsm.desktop',
  'lxqt-miriway-uwsm.desktop',
  'lxqt-niri-uwsm.desktop',
  'lxqt-river-uwsm.desktop',
  'lxqt-sway-uwsm.desktop',
  'lxqt-wayfire-uwsm.desktop',
]

foreach unit : compositor_units
  install_data(
    join_paths('wayland-sessions', unit),
    install_dir: WAYLAND_SESSIONS_DIR,
    install_mode: 'rw-r--r--',
  )
endforeach

install_data(
  'uwsm/env-lxqt',
  install_dir: UWSM_DIR,
  install_mode: 'rw-r--r--',
)

lxqt_uwsm_doc_files = [
  'README.md',
]

install_data(lxqt_uwsm_doc_files, install_dir: PKG_DOC_DIR)

lxqt_uwsm_license_files = [
  'LICENSE',
]

install_data(lxqt_uwsm_license_files, install_dir: PKG_LICENSE_DIR)

# Post-install script to copy the override.conf files that live in
# app-lxqt\x2d*@autostart.service.d directories.
meson.add_install_script('meson-install-overrides.sh')
