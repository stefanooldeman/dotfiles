#### Restore backup

Make sure [homesick](http://rubygems.org/gems/homesick "homesick is handles all your symlinks :] ") is installed

    #gem install homesick
    homesick clone stefanooldeman/dotfiles
    homesick symlink stefanooldeman/dotfiles

tnx @technicalpickles with homesick

#### For a quick use of any dotfile

you can follow these steps to synchronise them to another machine

    cd ~
    git clone http://github.com/stefanooldeman/dotvim.git stefanooldeman/dotfiles
    ln -s ~/stefanooldeman/dotfiles/home/.vim/vimrc ~/.vimrc
    cd ~/stefanooldeman/dotfiles/.vim
    git submodule init
    git submodule update

tnx @nelstrom with his posts on vimcast.org
