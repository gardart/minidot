#!/bin/bash

# Author: Gardar Thorsteinsson

USER_GIT_AUTHOR_NAME="Garðar Þorsteinsson"
USER_GIT_AUTHOR_EMAIL="gardart@gmail.com"

function setup_bash() {
  echo 'Installing oh-my-bash...'
  sh -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"
}

function setup_zsh() {
  echo 'Installing oh-my-zsh...'
  # sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  
  ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
  mkdir -p $ZSH_CUSTOM/plugins
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

  mkdir -p $ZSH_CUSTOM/themes
  curl -O https://gist.githubusercontent.com/schminitz/9931af23bbb59e772eec/raw/schminitz.zsh-theme -o $ZSH_CUSTOM/themes/schminitz.zsh-theme
  
  sed -i -- 's/^plugins=(/plugins=(\n  zsh-autosuggestions\n  zsh-syntax-highlighting\n/g' ~/.zshrc
  sed -i -- 's/ZSH_THEME="robbyrussell"/ZSH_THEME="gardar"/g' ~/.zshrc
}

function determine_shell() {
  echo 'Please pick your favorite shell:'
  echo '(1) Bash'
  echo '(2) Zsh'
  read -p 'Enter a number: ' SHELL_CHOICE
  if [[ $SHELL_CHOICE == '1' ]] ; then
    export LOGIN_SHELL="bash"
  elif [[ $SHELL_CHOICE == '2' ]] ; then
    export LOGIN_SHELL="zsh"
  else
    echo 'Could not determine choice.'
    exit 1
  fi
}

function setup_vim() {
  echo "Setting up vim...ignore any vim errors post install"
  vim +PlugInstall +qall
}

function setup_git() {
  echo 'Setting up git config...'
  read -e -p 'Enter Github author name: ' -i "$USER_GIT_AUTHOR_NAME" GIT_USER
  git config --global user.name "$GIT_USER"
  read -e -p 'Enter Github email: ' -i "$USER_GIT_AUTHOR_EMAIL" GIT_EMAIL
  git config --global user.email $GIT_EMAIL
  git config --global core.editor vim
  git config --global color.ui true
  git config --global color.diff auto
  git config --global color.status auto
  git config --global color.branch auto
}

function symlink_files() {

  # Uncomment the following line to delete all symlinks at the root of $HOME - useful for reinstalls
  # find "$HOME" -maxdepth 1 -type l -exec rm -f {} \;

  SELF_PATH="$( cd "$( dirname "$0" )" && pwd )" # Path to the directory containing this script

  # Create symlinks
  for file in `find $SELF_PATH -maxdepth 1 -name \*.symlink`; do
	src_file=`basename "$file"`
	dest_file=`echo "$HOME/.$src_file" | sed "s/\.symlink$//g"`
	if [ -e $dest_file ]; then
		echo "$dest_file already exists; skipping it..."
	else
		ln -sv $SELF_PATH/$src_file $dest_file
	fi
done

}

set -e
(
  determine_shell
  symlink_files
  setup_vim
  while true; do
    read -p "Configure Git?" yn
    case $yn in
        [Yy]* ) setup_git; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
	done
 
  while true; do
    read -p "Configure bash/zsh and install oh-my-zsh/oh-my-bash?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
	done
 
  if [[ $LOGIN_SHELL == 'bash' ]] ; then
    setup_bash
  elif [[ $LOGIN_SHELL == 'zsh' ]] ; then
    setup_zsh
  fi


  # if [[ $LOGIN_SHELL == 'bash' ]] ; then
  #   echo "Operating System setup complete."
  #   echo "Reloading session"

  #   source ~/.bashrc
  # elif [[ $LOGIN_SHELL == 'zsh' ]] ; then
    # echo "Changing shells to ZSH"
    # chsh -s /bin/zsh

    # echo "Operating System setup complete."
    # echo "Reloading session"
    # exec zsh
  # fi

)
