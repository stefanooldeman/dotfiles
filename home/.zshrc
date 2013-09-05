# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
DEFAULT_USER="stefano"
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

unsetopt AUTO_CD

[ -z "$TMUX" ] && export TERM=xterm-256color

# rvm
[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm

# Customize to your needs...
export PATH=~/.rvm/bin:/usr/local/bin:/usr/local/lib/node_modules:/usr/local/share/bpm/bin:$PATH
export PATH=/usr/local/heroku/bin:/usr/local/bin/elasticbeanstalk/bin/eb:$PATH
export PATH=/usr/local/share/python:$PATH

export DISCO_HOME=~/dev/spilgames/disco-development-workflow/disco
export PATH=$DISCO_HOME/bin:$PATH
export PATH=~/dev/riak-1.3.0/dev/dev2/bin:$PATH

# replacing commands with GNU version
#export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
#MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc
plugins=(brew osx redis-cli pip virtualenv)

alias mongostart="mongod run --config /usr/local/Cellar/mongodb/2.0.0-x86_64/mongod.conf"
alias ping="ping -c 7"
alias gitx="open . -a gitx"
alias untar="tar -zxvf"
alias vim="mvim -v"
alias zshconfig="vim ~/.zshrc"
alias .f="vim ~/.*"

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end
ulimit -n 4096
