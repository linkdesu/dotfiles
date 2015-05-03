# dotfiles

我私人用来管理dotfiles仓库，你可以随意浏览，但不建议随意使用~~

## Install

```shell
$ git clone git@github.com:xieaolin/dotfiles.git
$ ./dotfiles/sync.sh
```

## Useful Alias

```
alias composer='composer -vvv --profile'
alias jekyll_on='jekyll serve --watch --drafts'
alias reload_zshrc=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias php_xdebug="php -d xdebug.profiler_enable=1"
```

## Dependencies

* https://github.com/joelthelion/autojump
* http://vim.spf13.com/

