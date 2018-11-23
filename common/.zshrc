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

os=`uname`

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.oh-my-zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
case $os in
    "Linux")
        plugins=(git autojump)
        [[ -s /home/vagrant/.autojump/etc/profile.d/autojump.sh ]] && source /home/vagrant/.autojump/etc/profile.d/autojump.sh
    ;;
    "Darwin")
        plugins=(git brew autojump osx)
    ;;
    "Cygwin")
    ;;
esac

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8

# ============== ENV ==============

case $os in
    "Linux")
    ;;
    "Darwin")
        http_proxy_url=http://127.0.0.1:1087

        # Use homebrew vim
        export EDITOR='vim'
        vim=/usr/local/bin/vim
        # Set CLICOLOR if you want Ansi Colors in iTerm2
        export CLICOLOR=1
        # Set colors to match iTerm2 Terminal Colors
        export TERM=xterm-256color
        # Iterm shell integeration
        source ${HOME}/.iterm2_shell_integration.zsh

        # 主 Path 配置，注意 Homebrew 版 Node 的 Path 也在这里，并且根据版本号可能有变更
        export PATH=/usr/local/bin:/usr/local/sbin:$PATH
        # home
        export PATH=$PATH:~/bin
        # composer
        export PATH=$PATH:~/.composer/vendor/bin
        # Ruby Gemts
        export PATH=$PATH:/Library/Ruby/Gems/2.0.0/gems
        # Go
        export GOPATH=$HOME/Documents/go
        export PATH=$PATH:$GOPATH/bin
        # Python3 bin
        export PATH=$PATH:~/Library/Python/3.6/bin
        # Java
        export _JAVA_OPTIONS="-Djava.net.preferIPv4Stack=true"
        # Ansible
        export ANSIBLE_ROLES_PATH=$HOME/Documents/ansible/roles
        # Flutter
        export PATH=$PATH:~/bin/flutter/bin

        # 加速
        # export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottlesk
        export ELECTRON_MIRROR=https://npm.taobao.org/mirrors/electron/
    ;;
    "Cygwin")
    ;;
esac

# Switch http proxy to specific url
proxy () {
    action=$1

    case $action in
        "on")
        export http_proxy=$http_proxy_url
        export https_proxy=$http_proxy_url
        echo "HTTP Proxy On : "$http_proxy_url
        ;;
        "off")
        unset http_proxy
        unset https_proxy
        echo "HTTP Proxy Off"
        ;;
        *)
        echo "http_proxy="$http_proxy
        echo "http_proxy="$https_proxy
        ;;
    esac
}

# Backup all vscode configs
backup_vscode () {
    from_dir="$HOME/Library/Application Support/Code/User/"
    to_dir="$HOME/Documents/config/vscode/"
    cp ${from_dir}keybindings.json ${to_dir}
    cp ${from_dir}settings.json ${to_dir}
    cp -R ${from_dir}snippets/ ${to_dir}snippets
    code --list-extensions > ${to_dir}plugins_list.txt
    echo 'Backup vscode config files successfully!'
}

# Backup all atom configs
backup_atom () {
    from_dir="$HOME/.atom/"
    to_dir="$HOME/Documents/config/atom/"
    cp ${from_dir}config.cson ${to_dir}
    cp ${from_dir}keymap.cson ${to_dir}
    cp ${from_dir}snippets.cson ${to_dir}
    cp ${from_dir}init.coffee ${to_dir}
    cp ${from_dir}styles.less ${to_dir}
    echo 'Backup atom config files successfully!'
}

alias grep_c='grep -n --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn,.idea}'
alias vi='vim'
alias df='df -h'
alias du='du -h'
alias l='ls'

#alias composer='composer -vvv --profile'
alias pac_edit='code "$HOME/Documents/Config/proxy/linksrule.txt"'
alias reload_zshrc=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias privoxy_on="privoxy /usr/local/etc/privoxy/config"
alias http_server="python3 -m SimpleHTTPServer 8080"
alias http_serverx="python3 -m SimpleHTTPServer"
alias rsync="rsync -chavzP"
alias npmls="npm ls -g --depth=0"
alias docker_up="docker-compose up -d mysql nginx php-fpm postgres redis workspace snowflake grafana prometheus"
alias docker_bash="docker-compose exec workspace bash"
alias d="docker"
alias dc="docker-compose"
alias ip="curl http://members.3322.org/dyndns/getip"

# ============== SUFFIX 2 EDITOR ==============

alias -s txt=code
alias -s html=code
alias -s json=code
alias -s conf=code
alias -s md=code
alias -s ini=code
alias -s gz='tar -xzf'
alias -s tgz='tar -xzf'
alias -s zip='unzip'
alias -s bz2='tar -xjf'
