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
#plugins[5]="https://github.com/fholgado/minibufexpl.vim.git"
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
# new 
plugins[19]="https://github.com/derekwyatt/vim-scala.git"

declare COMMAND_T=${plugins[10]}

parsed_plugin_name(){
  if [[ "$1" =~ ([^\/]+).git$ ]]; then
    echo ${BASH_REMATCH[1]%.*} # remove additional .vim in name
  fi
}

post_install_command-t(){
  local plugin=$(parsed_plugin_name $COMMAND_T)
  cd home/.vim/bundle/$plugin/ruby/command-t
  echo `pwd`
  echo 'install the ruby stuff from here'
  echo with `ruby --version`
  ruby extconf.rb
  make
}

install_vim(){
  for address in "${plugins[@]}"; do
    if [ ${address##*.} = 'git' ]; then
      local NAME=`parsed_plugin_name $address`
      if [ -d  home/.vim/bundle/${NAME} ]; then
        echo "skipped, found clone ${NAME}"
      else
        git clone $address home/.vim/bundle/${NAME}
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
      echo '0.1.0' ;; 
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
