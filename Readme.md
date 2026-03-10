# Lain-sddm-theme

A sddm login screen inspired by 1998 anime [Serial Experiments Lain](https://en.wikipedia.org/wiki/Serial_Experiments_Lain).

**Note:**

**This is a fork. Original version can be found from [mixedCase](https://gitlab.com/mixedCase/sddm-lain-wired-theme) and [lll2yu](https://github.com/lll2yu/sddm-lain-wired-theme).**

## Differences

Compared to lll2yu's version, the main changes are:

* Rewrote parts of `Main.qml` to support Qt6
* Removed the original background music
* Shortened the intro of `welcome.wav`
* Unified the "User ID" character glyphs to a consistent full-width format

You can see a rough preview of the animation [here](https://youtu.be/M-p7cHx4OM0).

I had no prior experience with Qt before this, so there may be mistakes or improper usages in the changes — apologies in advance.

## Installation

You can follow the steps from the original repository, or do the following:

1. Make sure SDDM is installed and configured to use the Qt6 framework with all required dependencies
2. Place all files in this repository under `/usr/share/sddm/themes/lain-sddm-theme/`
3. Test with: `sddm-greeter-qt6 --test-mode --theme /usr/share/sddm/themes/lain-sddm-theme`

## Usage

Edit the SDDM configuration file (e.g. `/etc/sddm.conf.d/kde_settings.conf`) and set the current theme:

```shell
[Theme]
# Current theme name
Current=lain-sddm-theme
```
