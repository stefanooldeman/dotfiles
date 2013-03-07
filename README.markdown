# Restore backup

Make sure [homesick](http://rubygems.org/gems/homesick "homesick is handles all your symlinks :] ") is installed

    #gem install homesick
    homesick clone stefanooldeman/dotfiles
    homesick symlink stefanooldeman/dotfiles

tnx @technicalpickles with homesick

## use z-shell do:

    chsh -s `which zsh`
    # or if you're not sure then:
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

Virtualenv and zsh, go read here: http://virtualenvwrapper.readthedocs.org/en/latest/tips.html#zsh-prompt

## jslint usage in vim

    ln -s dotfiles/usr/bin/jslint /usr/bin/jslint

from within vim:

    !jslint %

ensure that the plugin downloaded and enabled in vim. normally in ~/.vim/bundle/jslint

# For a quick use of any dotfile

you can follow these steps to synchronise them to another machine

    cd ~
    git clone http://github.com/stefanooldeman/dotfiles.git
    cd dotfiles && git submodule update --init
    ln -s home/.vim/vimrc ~/.vimrc

tnx @nelstrom with his posts on vimcast.org
