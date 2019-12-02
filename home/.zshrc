export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vi


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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(pip docker kubectl osx rvm vi-mode)

source $ZSH/oh-my-zsh.sh

unsetopt AUTO_CD

[ -z "$TMUX" ] && export TERM=xterm-256color

# eval "$(pyenv virtualenv-init -)"

# INCLUDE SOME BINs manually on PATH
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export SCALA_HOME=/usr/local/Cellar/scala/2.12.1
SPARK_HOME=/opt/spark-1.6.0
MAVEN_HOME=/opt/apache-maven-3.3.9
export PATH=$MAVEN_HOME/bin:$SCALA_HOME/bin:$SPARK_HOME/bin:$PATH
export PATH=$HOME/.pyenv/versions/3.6.8/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$HOME/bin:$PATH # self scripted shit

# Go
export GOPATH=$HOME/dev/gohome
export GOROOT=/usr/local/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
# source ./script/activate or set manual when working on projects
# $GOPATH/bin:

# replacing commands with GNU version
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Add extra trivial scripts in ~/bin
export PATH=$HOME/.jenv/bin:$PATH
export CDPATH=.:~/dev/

[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

# eval "$(pyenv init -)"
alias "python3.5"="python3"
export PATH=$HOME/dev/m2/m2-tools:$PATH

# export PYENV_VERSION=2.7
alias mongostart="mongod run --config /usr/local/Cellar/mongodb/2.0.0-x86_64/mongod.conf"
alias ping="ping -c 7"
alias gitx="open . -a gitx"
alias untar="tar -zxvf"
alias zshconfig="vim ~/.zshrc"
alias jslint="/usr/bin/jslint"
alias git="/usr/local/bin/git"
alias evim="vi ~/.vimrc"

alias rtest="bundle exec ruby  -Itest"
alias rails_console="bundle exec ruby script/console"
alias rails_server="bundle exec ruby script/server"
alias ggrep="grep -Rni --exclude=tags --exclude-dir=tmp --exclude-dir=coverage --exclude-dir=test --exclude-dir=log --exclude-dir=.git"
alias gitx="open . -a gitx"
alias subl="open . -a Sublime\ Text"
alias mvim_reopen='git status --short | awk "{ print \$2; }" | xargs mvim'
alias bx='bundle exec'
alias prydoc='grep Pry -A 7 /Users/stefano/dev/S2M/test/test_helper.rb | pbcopy'
alias rubodiff='git diff --name-only HEAD master | grep ".rb" | xargs rubocop'
alias gg='gom exec ginkgo -skipPackage vendor --randomizeAllSpecs --randomizeSuites'
alias mux='tmuxinator'
alias avro='java -jar ~/bin/avro-tools.1.7.7.jar'
alias k="kubectl"
alias ks="kubectl --namespace kube-system"
alias kctx="kubectx"
alias kns="kubens"

source $HOME/.bash_alias

# compctl -K _pip_completion pip
# pip zsh completion end
ulimit -n 4096

export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

eval "$(jenv init -)"
