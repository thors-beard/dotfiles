#!/usr/bin/env zsh

if ! command -v brew &> /dev/null
then
    echo "You need to install brew first"
    echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    exit 1
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

brew tap homebrew/cask-fonts

brew install \
    starship \
    vim \
    the_silver_searcher \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    font-hack-nerd-font \
    --cask font-fira-code-nerd-font \
    --cask visual-studio-code \
    --cask qlmarkdown

curl -s "https://get.sdkman.io" | bash

git clone https://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh