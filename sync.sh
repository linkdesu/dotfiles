#!/bin/sh
home_dir=$HOME
config_dir=$home_dir/Documents/Config/home
dotfiles=(
        .zshrc
        .oh-my-zsh-custom
        .bashrc
        .bash_profile
        .ngrok
        .gitconfig
        .gitignore_global
        .pip
        .vimrc.bundles.local
        .vimrc.local
    )

for filename in ${dotfiles[@]}; do
    if [ -e $home_dir/$filename ] || [ -h $home_dir/$filename ];then
        echo "Delete $home_dir/$filename";
        rm $home_dir/$filename
    fi
    if [ -d $home_dir/$filename ];then
        echo "Delete dir $home_dir/$filename";
        rm -r $home_dir/$filename
    fi

    echo "Soft link $config_dir/$filename to $home_dir/$filename";
    ln -s $config_dir/$filename $home_dir/$filename
done