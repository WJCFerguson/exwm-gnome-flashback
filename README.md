# exwm-gnome-flashback [![LICENSE](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://choosealicense.com/licenses/mit/)

Allows you to use exwm in a GNOME-Flashback session.  This is the Gnome 'fallback' session, which restores functionality that has been subsumed into the Gnome Shell, making it more suitable for running other WMs.  The aim is to piggy-back `exwm` onto the curated conveniences of the Gnome Desktop Environment.

This is simplistically ripped from [`i3-gnome-flashback`](https://github.com/deuill/i3-gnome-flashback) (pretty much `s/i3/exwm/`), which in turn was based on  [`i3-gnome`](https://github.com/lvillani/i3-gnome) project.

This has been tested working on GNOME version **3.36** (Ubuntu 20.04).

There is a branch for 3.28.1 (Ubuntu 16.04)

Please inform me via Issues or PRs of any useful fixes or improvements to this.

# Installation

Clone this repository and run `make install` with root priviledges.

Install the `gnome-flashback` package, and of course `Emacs` with the `exwm` package.

This setup launches `Emacs` with `emacs --eval '(exwm-enable)'`, so configure your `Emacs` to load `exwm` when `(exwm-enable)` is executed, e.g.:
``` emacs-lisp
(autoload 'exwm-enable "my-exwm-config.el")
```

# Desirable flashback config overrides

## Hotkeys

Gnome-flashback defines Super-based hotkeys and you have to disable these if you want to use them from within Emacs.  Common exwm bindings `s-SPC` and `s-l` in particular need to be unset.  You can disable them in `gnome-control-center`, but it can also be done via `gsettings`:

``` sh
# to unset s-SPC
gsettings set org.gnome.desktop.wm.keybindings switch-input-source '[]'
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward '[]'
# s-l
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver '[]'
```

Note: if trying to determine how to automate unsetting, send current settings to a reference file: `gsettings list-recursively > /tmp/ref`; make your change; view the difference: `diff /tmp/ref <(gsettings list-recursively)`.

## Desktop Icons

To remove desktop icons, if using transparency to a desktop image:
```
gsettings set org.gnome.gnome-flashback.desktop.icons show-trash false
gsettings set org.gnome.gnome-flashback.desktop.icons show-home false
```

# Notes

To understand how the files in this repo work to initialize an i3 and GNOME session, refer to this [GNOME wiki](https://wiki.gnome.org/Projects/SessionManagement/RequiredComponents) on session management.
