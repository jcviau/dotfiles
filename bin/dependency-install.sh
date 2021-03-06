#! /usr/bin/env bash

create_ssh() {
  mkdir -p "$HOME"/.ssh
  chmod 0700 "$HOME"/.ssh
}

fonts_install() {
  if ! [ -d "$HOME"/.local/share/fonts ]; then
    echo "Step fonts: Installing."
    mkdir -p "$HOME"/.local/share/fonts
    curl -fLo "roboto-mono.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip
    unzip "$HOME"/tmp/roboto-mono.zip -d "$HOME"/tmp/roboto-mono
    mv "$HOME"/tmp/roboto-mono/*Mono.ttf "$HOME"/.local/share/fonts/
    mv "$HOME"/tmp/roboto-mono/*Complete.ttf "$HOME"/.local/share/fonts/
    postStepInstall "fonts"
  else
    echo "Step fonts: Already installed"
  fi
}

apt_install() {
  if [ "$(uname)" = "Linux" ]; then
    echo "Step apt packages: Installing."
    # Add repository that contains all python releases
    sudo add-apt-repository -y ppa:deadsnakes/ppa
    sudo apt-get update
    # Essentials
    # bsdmainutils: column tool used in git-summary script
    # python-pygments: used by colorize plugin (cat with syntax colors)
    # less: used by cat alias
    sudo apt-get -qq install curl unzip zsh python3.8 less bsdmainutils python3-pygments

    if ! [ -f /usr/bin/python ]; then
      echo "Creating Python symlink"
      sudo ln -s /usr/bin/python3 /usr/bin/python
    else
      echo "Python symlink: Already created"
    fi

    # Optional
    sudo apt-get -qq install htop xclip
    postStepInstall "apt packages"
  else
    echo "Step apt packages: Nothing to install for $(uname)"
  fi
}

oh_my_zsh_install() {
  if ! [ -d "$HOME"/.oh-my-zsh ]; then
    echo "Step oh-my-zsh: Installing."
    curl -fLo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    sh install.sh --unattended --keep-zshrc --skip-chsh
    postStepInstall "oh-my-zsh"
  else
    echo "Step oh-my-zsh: Already installed"
  fi
}

fzf_install() {
  if ! [ -f "$HOME"/.fzf.zsh ]; then
    echo "Step fzf: Installing."
    git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME"/.fzf
    "$HOME"/.fzf/install --all --no-fish 
    postStepInstall "fzf"
  else
    echo "Step fzf: Already installed"
  fi
}

exa_install() {
  if ! [ -f "$HOME"/.local/bin/exa ]; then
    echo "Step exa: Installing."
    curl https://sh.rustup.rs -sSf | sh -s -- -q -y
    curl -fLo "exa-linux-x86_64.zip" https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
    unzip exa-linux-x86_64.zip
    mkdir -p "$HOME"/.local/bin
    mv exa-linux-x86_64 "$HOME"/.local/bin/exa
    postStepInstall "exa"
  else
    echo "Step exa: Already installed"
  fi
}

autojump_install() {
  if ! [ -d "$HOME"/.autojump ]; then
    echo "Step autojump: Installing."
    git clone --depth=1 https://github.com/wting/autojump.git
    cd autojump
    ./install.py --force
    postStepInstall "autojump"
    cd ..
  else
    echo "Step autojump: Already installed"
  fi
}

p10k_theme_install() {
  if ! [ -d "$HOME"/zsh/custom/themes/powerlevel10k ]; then
    echo "Step powerlevel10k theme: Installing."
    mkdir -p "$HOME"/zsh/custom/themes
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME"/zsh/custom/themes/powerlevel10k
    postStepInstall "powerlevel10k theme"
  else
    echo "Step powerlevel10k theme: Already installed"
  fi
}

preStepInstall() {
  echo Step $1: Installing.
}

postStepInstall() {
  if [ $? -eq 0 ]; then
    echo "Step $1: Installation Completed."
  else
    echo "Step $1: Installation FAILED with status $?."
  fi
}

install() {
  # Install from tmp folder
  # Required to fix issues when writting files under this clone in a dev container (file/directory not found & cwd issue)
  mkdir -p "$HOME"/tmp
  cd "$HOME"/tmp

  apt_install
  fonts_install
  oh_my_zsh_install
  p10k_theme_install
  autojump_install
  fzf_install
  exa_install

  rm -rf "$HOME"/tmp
}

create_ssh
install
