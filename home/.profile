#path export moved to .bashrc

#prompt line
export PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'
#PS1="[\u @ \$CurDir]\$ "
# even funnier is with a smily
PS1=" \$CurDir:) "

#todo make colours work under ubuntu and osx: alias ls="ls -laG"
alias ls="ls -lG"
alias lsd="ls -laG"
alias ping="ping -c 7"
alias tree="~/.tree.sh"
alias "gtree"="git log --graph --oneline --decorate"
