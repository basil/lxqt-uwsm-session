# LXQt Universal Wayland Session

A Wayland session for LXQt managed by [Universal Wayland Session
Manager](https://github.com/Vladimir-csp/uwsm) (UWSM).

### Prerequisites

- [LXQt](https://lxqt-project.org)
- [UWSM](https://github.com/Vladimir-csp/uwsm)

The following compositors are currently supported:

- [Labwc](https://github.com/labwc/labwc) (version 0.7.2 and higher)
- [Miriway](https://github.com/Miriway/Miriway)
- [Wayfire](https://wayfire.org)
- [KWin/Wayland](https://community.kde.org/KWin/Wayland)
- [Hyprland](https://hypr.land)
- [Niri](https://github.com/YaLTeR/niri)
- [river](https://isaacfreund.com/software/river/)
- [Sway](https://swaywm.org)

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

Log into one of the new **LXQt (uwsm-managed)** sessions.
