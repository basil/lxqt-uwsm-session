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
    unit,
    install_dir: SD_USER_DIR,
    install_mode: 'rw-r--r--',
  )

  install_symlink(
    unit,
    install_dir: join_paths(SD_USER_DIR, 'graphical-session.target.wants'),
    pointing_to: join_paths(SD_USER_DIR, unit),
  )
endforeach

# NOTE: The override.conf files live in directories whose names contain a
# literal '\x2d'. Meson cannot handle backslashes in path components, so we
# install those via a separate install script instead of install_data().
