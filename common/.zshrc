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
        plugins=(git autojump z pyenv pip npm yarn nvm sudo redis-cli)
    ;;
    "Darwin")
        plugins=(git autojump z pyenv pip npm yarn nvm sudo redis-cli brew osx)
    ;;
    "Cygwin")
    ;;
esac

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8


# ============== ENV ==============

case $os in
    "Linux")
    ;;
    "Darwin")
        # Use homebrew vim
        export EDITOR='vim'
        vim=/usr/local/bin/vim
        # Set CLICOLOR if you want Ansi Colors in iTerm2
        export CLICOLOR=1
        # Set colors to match iTerm2 Terminal Colors
        export TERM=xterm-256color
        # Iterm shell integeration
        source ${HOME}/.iterm2_shell_integration.zsh

        # home
        export PATH=~/bin:$PATH
        # Ruby
        # /usr/local/lib/ruby/gems/*/bin 这个路径可以通过 gem environment 的 EXECUTABLE DIRECTORY 发现
        export PATH=/usr/local/lib/ruby/gems/2.6.0/bin:$PATH
        export PATH=/usr/local/opt/ruby/bin:$PATH
        # Go
        export PATH=$HOME/Documents/go/bin:$PATH
        # Java
        # 因为系统启用了 IPv6 ，所以这里需要告知 java 优先使用 IPv4
        export _JAVA_OPTIONS="-Djava.net.preferIPv4Stack=true"
        # Ansible
        export ANSIBLE_ROLES_PATH=$HOME/Documents/ansible/roles
        # Flutter
        export PATH=~/bin/flutter/bin:$PATH
        # nvm
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        # 主 Path 配置，注意 Homebrew 版 Node 的 Path 也在这里，并且根据版本号可能有变更
        export PATH=/usr/local/bin:/usr/local/sbin:$PATH
    ;;
    "Cygwin")
    ;;
esac


# ============== APP ==============

# acme.sh
if [[ -d $HOME/.acme.sh ]];then
    echo "Init acme"
    . "$HOME/.acme.sh/acme.sh.env"
fi

# 如果启用了 nvm ，进入目录时检查 .nvmrc 并尝试载入
if [[ -d $NVM_DIR ]];then
    echo "Init nvm"
    autoload -U add-zsh-hook
    load-nvmrc() {
        local node_version="$(nvm version)"
        local nvmrc_path="$(nvm_find_nvmrc)"

        if [ -n "$nvmrc_path" ]; then
            local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
            if [ "$nvmrc_node_version" != "$node_version" ]; then
                nvm use
            fi
        fi
    }
    add-zsh-hook chpwd load-nvmrc
    load-nvmrc
fi

# Switch http proxy to specific url
proxy () {
    action=$1
    http_proxy_url=$2

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


# ============== ALIAS ==============

alias vi='vim'
alias df='df -h'
alias du='ncdu'
alias l='exa'
alias ll='exa -l --group-directories-first --time-style iso'
alias lt='exa -lT --group-directories-first --time-style iso'

alias reload_zshrc=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias rsync="rsync -chavzP"
alias npm-ls="npm ls --depth=0"
alias nvm-ls="nvm ls-remote --lts | grep Latest"
alias d="docker"
alias dc="docker-compose"
alias ip="curl http://members.3322.org/dyndns/getip"
alias ping_proxy='sudo nping --tcp -p 5664 cn3.vxtrans.link'

alias frp-on="frpc -c ~/Documents/config/frp/frpc.ini"
alias frp-reload="frpc reload -c ~/Documents/config/frp/frpc.ini"
alias frp-workstation="frpc -c ~/Documents/config/frp/frpc.workstation.ini"

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
