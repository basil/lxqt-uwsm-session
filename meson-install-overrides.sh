#!/bin/sh

set -eu

src="${MESON_SOURCE_ROOT}/systemd/user"
dest="${MESON_INSTALL_DESTDIR_PREFIX}/lib/systemd/user"

install -Dm644 \
	"$src/"'app-lxqt\x2ddesktop@autostart.service.d/override.conf' \
	"$dest/"'app-lxqt\x2ddesktop@autostart.service.d/override.conf'

install -Dm644 \
	"$src/"'app-lxqt\x2dglobalkeyshortcuts@autostart.service.d/override.conf' \
	"$dest/"'app-lxqt\x2dglobalkeyshortcuts@autostart.service.d/override.conf'

install -Dm644 \
	"$src/"'app-lxqt\x2dnotifications@autostart.service.d/override.conf' \
	"$dest/"'app-lxqt\x2dnotifications@autostart.service.d/override.conf'

install -Dm644 \
	"$src/"'app-lxqt\x2dpanel@autostart.service.d/override.conf' \
	"$dest/"'app-lxqt\x2dpanel@autostart.service.d/override.conf'

install -Dm644 \
	"$src/"'app-lxqt\x2dpolicykit\x2dagent@autostart.service.d/override.conf' \
	"$dest/"'app-lxqt\x2dpolicykit\x2dagent@autostart.service.d/override.conf'

install -Dm644 \
	"$src/"'app-lxqt\x2dpowermanagement@autostart.service.d/override.conf' \
	"$dest/"'app-lxqt\x2dpowermanagement@autostart.service.d/override.conf'

install -Dm644 \
	"$src/"'app-lxqt\x2drunner@autostart.service.d/override.conf' \
	"$dest/"'app-lxqt\x2drunner@autostart.service.d/override.conf'

install -Dm644 \
	"$src/"'app-lxqt\x2dxscreensaver\x2dautostart@autostart.service.d/override.conf' \
	"$dest/"'app-lxqt\x2dxscreensaver\x2dautostart@autostart.service.d/override.conf'

exit 0
