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

function ln_dotfile() {
    source_file=$1
    target_file=$2

    if [[ -e $target_file || -h $target_file ]]; then
        echo "Remove old dotfile $target_file ...";
        rm $target_file
    elif [ -d $target_file ]; then
        echo "Delete old dotdir $target_file";
        rm -r $target_file
    fi

    echo "Soft link $source_file to $target_file";
    ln -s $source_file $target_file
}

files=$(ls -a $common_config_dir)
for file in $files; do
    if [[ $file != "." && $file != ".." && $file != ".DS_Store" ]]; then
        ln_dotfile $common_config_dir/$file $home_dir/$file
    fi
done

files=$(ls -a $os_config_dir)
for file in $files; do
    if [[ $file != "." && $file != ".." && $file != ".DS_Store" ]]; then
        ln_dotfile $os_config_dir/$file $home_dir/$file
    fi
done

echo "Done !"