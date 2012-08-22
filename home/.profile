#path export moved to .bashrc
source $HOME/.bashrc

# if you get warnings when running: source .profile ignore them..
for PROFILE_SCRIPT in $( ls /etc/profile.d/*.sh ); do
    source $PROFILE_SCRIPT
done

#todo make colours work under ubuntu and osx: alias ls="ls -laG"
alias ls="ls -lGh"
alias lsd="ls -laGh"
alias ping="ping -c 7"
alias gitx="open . -a gitx"
alias git=hub
