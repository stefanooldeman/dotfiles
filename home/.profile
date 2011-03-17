#path export moved to .bashrc

#prompt line
export PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'
#PS1="[\u @ \$CurDir]\$ "
# even funnier is with a smily
PS1=" \$CurDir:) "

alias ls="ls -laG"
alias sites="cd ~/Sites/"
alias ping="ping -c 7"
alias tree="~/.tree.sh"
alias "gtree"="git log --graph --oneline --decorate"
