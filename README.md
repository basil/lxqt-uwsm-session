# LXQt Universal Wayland Session

A Wayland session for LXQt managed by [Universal Wayland Session
Manager](https://github.com/Vladimir-csp/uwsm) (UWSM).

### Prerequisites

- [LXQt](https://lxqt-project.org/)
- [UWSM](https://github.com/Vladimir-csp/uwsm)

The following compositors are currently supported:

- [labwc](https://github.com/labwc/labwc)

This project aims to eventually support all the compositors and
configurations currently provided in
[lxqt-wayland-session](https://github.com/lxqt/lxqt-wayland-session).
Pull requests are welcome.

### Installation

```sh
meson setup --prefix=/usr/local build
meson install -C build
```

### Usage

Ensure you have logged into LXQt at least once. Then log into the new **LXQt
(labwc, uwsm-managed)** session:

```sh
uwsm start -e -D LXQt:labwc -- labwc.desktop
```

The first time you log in, enable the following services:

```sh
systemctl --user enable --now lxqt-desktop.service
systemctl --user enable --now lxqt-globalkeyshortcuts.service
systemctl --user enable --now lxqt-notifications.service
systemctl --user enable --now lxqt-panel.service
systemctl --user enable --now lxqt-policykit-agent.service
systemctl --user enable --now lxqt-powermanagement.service
systemctl --user enable --now lxqt-runner.service
systemctl --user enable --now lxqt-xscreensaver-autostart.service
```
