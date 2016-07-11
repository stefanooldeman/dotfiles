#!/bin/bash

# sanity options
set -u
set -e

usage() {
  cat<<EOU
NAME
    ${0##*/}
 
DESCRIPTION
    Utility to simply get started with the dotfiles. This script requires (GNU) BASH >= 4
 
SYNOPSIS
    ${0##*/} [OPTIONS] <command>

COMMANDS
  vim      installs all VIM plugins
  symlink  depending on options, symlinks dotfiles to $HOME
  unlink

OPTIONS
  -v be verbose about progress and actions in the program
  --version shows version
  --help  shows this help
EOU
}

plugins[0]="https://github.com/scrooloose/nerdtree.git"
plugins[1]="https://github.com/vim-scripts/taglist.vim.git"
plugins[2]="https://github.com/sjl/gundo.vim.git"
plugins[3]="https://github.com/tpope/vim-fugitive.git"
plugins[4]="https://github.com/vim-scripts/PDV--phpDocumentor-for-Vim.git"
plugins[5]="https://github.com/kien/ctrlp.vim.git"
plugins[6]="https://github.com/nanotech/jellybeans.vim.git"
plugins[7]="https://github.com/Lokaltog/vim-powerline.git"
plugins[8]="https://github.com/tpope/vim-liquid.git"
plugins[9]="https://github.com/vim-scripts/TaskList.vim.git"
plugins[10]="https://github.com/wincent/Command-T.git"
plugins[11]="https://github.com/hallettj/jslint.vim.git"
plugins[12]="https://github.com/rodjek/vim-puppet.git"
plugins[13]="https://github.com/godlygeek/tabular.git"
plugins[14]="https://github.com/evanmiller/nginx-vim-syntax.git"
plugins[15]="https://github.com/vim-scripts/UltiSnips.git"
plugins[16]="https://github.com/mitsuhiko/vim-jinja.git"
plugins[17]="https://github.com/scrooloose/syntastic.git"
plugins[18]="https://github.com/vim-scripts/closetag.vim.git"
plugins[19]="https://github.com/derekwyatt/vim-scala.git"
plugins[20]="git@github.com:vim-scripts/project.tar.gz.git"
plugins[21]="https://github.com/fatih/vim-go.git"
plugins[22]="git@github.com:rking/ag.vim.git"
plugins[23]="git@github.com:terryma/vim-smooth-scroll.git"
# new
plugins[24]="https://github.com/terryma/vim-multiple-cursors.git"
plugins[25]="https://github.com/rizzatti/dash.vim.git"

declare COMMAND_T=${plugins[10]}

parsed_plugin_name(){
  if [[ "$1" =~ ([^\/]+).git$ ]]; then
    echo ${BASH_REMATCH[1]%.*} # remove additional .vim in name
  fi
}

post_Command-T(){
  local plugin=$(parsed_plugin_name $COMMAND_T)
  cd home/.vim/bundle/$plugin/ruby/command-t
  echo `pwd`
  echo 'install the ruby stuff from here'
  echo with `ruby --version`
  ruby extconf.rb
  make
}

post_ag(){
  brew install the_silver_searcher
  vim +Helptags
}

install_vim(){
  for address in "${plugins[@]}"; do
    if [ ${address##*.} = 'git' ]; then
      local NAME=`parsed_plugin_name $address`
      if [ -d  home/.vim/bundle/${NAME} ]; then
        echo "skipped, found clone ${NAME}"
      else
        git clone $address home/.vim/bundle/${NAME}
        # call post install
        "post_${NAME}" 2> /dev/null
        "post_${NAME}" 2> /dev/null
      fi
    fi
  done
}

symlink_home(){
  dotfiles=`find home -depth 1`  # skips special . and ..
  for path in $dotfiles; do
    ln -s $path $HOME/`basename $path`
  done
}

unlink(){
  dotfiles=ls -la $HOME | grep `pwd`
  echo $dotfiles
  for path in $dotfiles; do
    unlink $path
  done
}

main(){
  case "${1:-no_option}" in
    '--version')
      echo '0.1.1' ;;
    '--help')
        usage ;;
    'vim')
      install_vim ;;
    'symlink')
      symlink_home ;;
    'unlink')
      unlink ;;
    'no_option')
      echo "error: for usage, see $0 --help"
      ;;
  esac
}

main $*
