# dotfiles

我私人用来管理dotfiles仓库，你可以随意浏览，但不建议随意使用~~

## Install

```shell
$ git clone git@github.com:xieaolin/dotfiles.git
$ ./dotfiles/sync.sh
```

### Centos

Centos 下不应该通过 `yum` 来安装 autojump 命令，而应该从 git 上的源码安装:

```shell
$ wget https://github.com/joelthelion/autojump/archive/release-v22.2.4.tar.gz
$ tar zxf release-v22.2.4.tar.gz
$ cd autojump-release-v22.2.4
$ ./install.py # 这里千万不要sodu，如果装错了可以使用 uninstall.py 脚本回滚
```

## Dependencies

* https://github.com/joelthelion/autojump
* http://vim.spf13.com/
