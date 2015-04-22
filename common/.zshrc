# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bureau"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# ============== User configuration ==============

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.oh-my-zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew autojump osx)

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8

# ============== PATH ==============
# home
export PATH=$PATH:~/bin
# composer
export PATH=$PATH:~/.composer/vendor/bin
# Homebrew php 5.5
export PATH="$PATH:$(brew --prefix homebrew/php/php55)/bin"
# Ruby Gemts
export PATH=$PATH:/Library/Ruby/Gems/2.0.0/gems

# ============== OTHER ==============

# Sublime Text
export EDITOR='subl'

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1
# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

alias grep='grep -n --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn,.idea}'
alias vi='vim'
alias df='df -h'
alias du='du -h'

alias composer='composer -vvv --profile'
alias sshxl='sshpass -f "$HOME/Documents/其他/工作资料/passwd" ssh xieaolin@essh.sandai.net'
alias gfwlist2pac='gfwlist2pac -i "$HOME/Documents/Config/proxy/gfwlist.txt" -f "$HOME/bin/link.pac" -p "SOCKS5 127.0.0.1:20000; SOCKS 127.0.0.1:20000; DIRECT" --user-rule "$HOME/Documents/Config/proxy/linksrule.txt"'
alias jekyll_on='jekyll serve --watch --drafts'
alias reload_zshrc=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

# ============== SUFFIX 2 EDITOR ==============

alias -s html=subl
alias -s json=subl
alias -s conf=subl
alias -s md=subl
alias -s ini=subl
alias -s gz='tar -xzf'
alias -s tgz='tar -xzf'
alias -s zip='unzip'
alias -s bz2='tar -xjf'
