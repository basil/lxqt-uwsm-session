# LXQt Universal Wayland Session

A Wayland session for LXQt, managed by the [Universal Wayland Session
Manager](https://github.com/Vladimir-csp/uwsm) (UWSM).

### Motivation

The design of `lxqt-session` predates systemd and runs the entire session as
child processes of a single parent process. This conflicts with [systemd's
recommendations](https://systemd.io/DESKTOP_ENVIRONMENTS/) and with how most
other desktop environments are implemented.

By instead running each application in its own systemd user unit (as recommended
by systemd), we avoid the risk that a single memory-hungry application will take
down the entire session, and we gain the ability to easily inspect applications,
e.g. with:

```sh
systemctl --user status <my-app>
```

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

### Installation

```sh
meson setup --prefix=/usr/local build
meson install -C build
```

### Configuration

This repository does not provide compositor-specific configuration files. For
LXQt-specific configuration for your compositor, see
[lxqt-wayland-session](https://github.com/lxqt/lxqt-wayland-session).

When configuring your compositor:

- Do not run `lxqt-session`, as UWSM replaces `lxqt-session`.
- Do not customize the environment in your compositor configuration, as UWSM
  provides its own environment-management facilities. Instead, place environment
  additions in `~/.config/uwsm/env-lxqt`.
- Do not run `lxqt-qdbus run`, as UWSM provides its own `uwsm app` command for
  starting applications in the proper systemd slices.
- Do not autostart applications from your compositor configuration, as UWSM
  invokes systemd's standard autostart mechanism.

### Usage

Log in to one of the **LXQt (uwsm-managed)** sessions in SDDM.

### Implementation details

Upstream LXQt delivers its modules as XDG autostart desktop files with
`X-LXQt-Module=true`, and `lxqt-session` treats these specially when starting
the session. When running under UWSM, these autostart files are disabled and
replaced with systemd services, which launch LXQt modules in the correct systemd
slice and manage their lifecycle via systemd (including automatic restarts on
failure).

### Known issues

Applications launched from the LXQt panel or runner are not currently started in
the correct systemd slice. As a short-term workaround, launch applications via:

- A compositor keybinding that runs `uwsm app`, or
- An [alternative application runner that supports launch
  prefixes](https://github.com/Vladimir-csp/uwsm?tab=readme-ov-file#3-applications-and-slices).

In the long term, LXQt itself should be enhanced to support launch prefixes as a
first-class configuration option.

### Future work

- Add OS packaging (pull requests welcome).
- Patch LXQt to support a launch prefix for `uwsm app`.
- Test more compositors and fix any remaining issues.
