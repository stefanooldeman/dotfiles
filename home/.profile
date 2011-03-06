#lsexport MANPATH=/opt/local/share/man:$MANPATH #FAIL
#export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:~/Dev/PHP/lithium/labraries/lithium/console/li3:$PATH
#export DISPLAY=:0.0

#terminal prompt line#
export PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'
#PS1="[\u @ \$CurDir]\$ "
# even funnier is with a smily
PS1=" \$CurDir:) "

# AliAS
alias yunoo="clear
cat ~/Dropbox/Yunoo/yunoo-ascii-art.txt
cd ~/Sites/mijn.yunoo.nl/"

alias yClearCache="rm -f ~/Sites/mijn.yunoo.nl/media/default/cache/*.*
rm -f ~/Sites/mijn.yunoo.nl/tmp/cache/default/cache/yimageproxy/*.*
rm -fr  ~/Sites/mijn.yunoo.nl/tmp/cache/*
echo deleted yunoo cache files"

#ySvnUp has dependency on yClearCache
alias ySvnUp="cd ~/Sites/
echo updating mijn.yunoo.nl
svn up mijn.yunoo.nl/
echo updating onze.yunoo.nl
svn up g.yunoo.nl/
echo updating shared-libs
svn up shared-libs/
yClearCache
"

alias ls="ls -laG"
alias sites="cd ~/Sites/"
alias ping="ping -c 7"
alias li3="~/Dev/PHP/lithium/libraries/lithium/console/li3"
alias tree="~/.tree.sh"
alias "gtree"="git log --graph --oneline --decorate"

# Ubuntu
alias xclip="xclip -sel clip <"
