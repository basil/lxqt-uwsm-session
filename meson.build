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

subdir('systemd/user')
subdir('wayland-sessions')
subdir('uwsm')

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
