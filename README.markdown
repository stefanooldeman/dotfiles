#### Restore backup

Make sure [homesick](http://rubygems.org/gems/homesick "homesick is handles all your symlinks :] ") is installed

    #gem install homesick
    homesick clone stefanooldeman/dotfiles
    homesick symlink stefanooldeman/dotfiles

tnx @technicalpickles with homesick

to use z-shell do:

    chsh -s `which zsh`
    # or if you're not sure then:
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

Virtualenv and zsh, go read here: http://virtualenvwrapper.readthedocs.org/en/latest/tips.html#zsh-prompt

#### For a quick use of any dotfile

you can follow these steps to synchronise them to another machine

    cd ~
    git clone http://github.com/stefanooldeman/dotvim.git stefanooldeman/dotfiles
    ln -s ~/stefanooldeman/dotfiles/home/.vim/vimrc ~/.vimrc
    cd ~/stefanooldeman/dotfiles/.vim
    git submodule init
    git submodule update

tnx @nelstrom with his posts on vimcast.org
