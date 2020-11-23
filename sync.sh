#!/bin/sh

if [[ ! -f $PWD/sync.sh ]]; then
    echo "You must run this command from dotfiles repository directory , like this : cd dotfiles ; ./sync.sh"
    exit 1
fi

os=`uname`
home_dir=$HOME
work_dir=$PWD
common_config_dir=$work_dir/common
case $os in
    "Linux")
        os_config_dir=$work_dir/linux
    ;;
    "Darwin")
        os_config_dir=$work_dir/osx
    ;;
    "Cygwin")
        os_config_dir=$work_dir/cygwin
    ;;
esac

echo "OS: $os"
echo "HOME: $home_dir"
echo "WORKDIR: $work_dir"
echo "common_config_dir: $common_config_dir"
echo "os_config_dir: $os_config_dir"
echo "\n"

# create symlink for file
function ln_file() {
    source_file=$1
    target_file=$2

    if [[ -f $target_file || -h $target_file ]]; then
        echo "Remove old dotfile $target_file ...";
        rm $target_file
    elif [ -d $target_file ]; then
        echo "Delete old dotdir $target_file";
        rm -r $target_file
    fi

    echo "Soft link $source_file to $target_file";
    ln -s $source_file $target_file
}

# create symlinks for files in source_dir
function ln_dir() {
    source_dir=$1
    target_dir=$2

    if [[ ! -d $target_dir ]]; then
        mkdir -p $target_dir
    fi

    files=$(ls -a $source_dir)
    for file in $files; do
        if [[ $file != "." && $file != ".." && $file != ".DS_Store" ]]; then
            ln_file $source_dir/$file $target_dir/$file
        fi
    done
}

# walk through $common_config_dir, create symlinks for everything in it
files=$(ls -a $common_config_dir)
for file in $files; do
    if [[ $file != "." && $file != ".." && $file != ".DS_Store" ]]; then
        if [[ -d $common_config_dir/$file ]]; then
            ln_dir $common_config_dir/$file $home_dir/$file
        else
            ln_file $common_config_dir/$file $home_dir/$file
        fi
    fi
done

# walk through $os_config_dir, create symlinks for everything in it
files=$(ls -a $os_config_dir)
for file in $files; do
    if [[ $file != "." && $file != ".." && $file != ".DS_Store" ]]; then
        if [[ -d $common_config_dir/$file ]]; then
            ln_dir $os_config_dir/$file $home_dir/$file
        else
            ln_file $os_config_dir/$file $home_dir/$file
        fi
    fi
done

echo "Done !"