#path export moved to .bashrc
source $HOME/.bashrc
source $HOME/.git-completion.bash

#prompt line
export PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'
# with a smily
# PS1=" \$CurDir:) "

export GIT_PS1_SHOWDIRTYSTATE=true
txtylw='\033[1;33m' # Yellow
fgcolor="\033[0m"    # unsets color to term's fg color
twolevelprompt='$([ "$PWD" != "${PWD%/*/*/*}" ] && echo "/...${PWD##${PWD%/*/*}}" || echo "$PWD")'
gitprompt='$(__git_ps1 "[%s]")'
PS1=" \$CurDir\[$txtylw\]$gitprompt\[$fgcolor\]"':) '

#todo make colours work under ubuntu and osx: alias ls="ls -laG"
alias ls="ls -lGh"
alias lsd="ls -laGh"
alias ping="ping -c 7"
