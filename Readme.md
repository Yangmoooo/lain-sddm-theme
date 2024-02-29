# Lain-sddm-theme

A sddm login screen inspired by 1998 anime [Serial Experiments Lain](https://en.wikipedia.org/wiki/Serial_Experiments_Lain).

**Note:
This is a fork.
Original version can be found from [mixedCase](https://gitlab.com/mixedCase/sddm-lain-wired-theme) and [lll2yu](`https://github.com/lll2yu/sddm-lain-wired-theme`).**

## Differences

与 lll2yu 的版本差别不大，主要有：

* 重写了部分 Main.qml 以支持 qt6
* 删去了原本的背景音
* 减短了 welcome.wav 的前摇
* 将原本未统一的“User ID”更换为相同的字形

可以在 [这里](https://youtu.be/M-p7cHx4OM0) 查看大致的动态效果。

此前我并没有接触过 qt，对于修改的内容可能存在不当和错误，请见谅。

## Installation

可以参考原仓库的步骤，或进行如下操作：

1. 确保 SDDM 已经安装和配置好，使用的是 qt6 框架并安装了相应的依赖
2. 将仓库内的所有文件置于 `/usr/share/sddm/themes/lain-sddm-theme/` 下
3. 使用 `sddm-greeter-qt6 --test-mode --theme /usr/share/sddm/themes/lain-sddm-theme` 进行测试

## Usage

在 SDDM 的配置文件（如 `/etc/sddm.conf.d/kde_settings.conf`）中修改当前主题即可：

```shell
[Theme]
# Current theme name
Current=lain-sddm-theme
```
