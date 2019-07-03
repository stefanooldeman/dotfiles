#path export moved to .bashrc
source $HOME/.bashrc

# if you get warnings when running: source .profile ignore them..
for PROFILE_SCRIPT in $( ls /etc/profile.d/*.sh ); do
    source $PROFILE_SCRIPT
done


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
