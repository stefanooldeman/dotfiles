#### Restore backup

make sure gem homesick is installed

* todo add install instructions for homesick clone + symlink

#### For a quick use of any dotfile

you can follow these steps to synchronise them to another machine

    cd ~
    git clone http://github.com/stefanooldeman/dotvim.git stefanooldeman/dotfiles
    ln -s ~/stefanooldeman/dotfiles/home/.vim/vimrc ~/.vimrc
    cd ~/stefanooldeman/dotfiles/.vim
    git submodule init
    git submodule update

Credits: @nelstrom with his posts on vimcast.org
