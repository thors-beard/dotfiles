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

brew install \
    starship \
    vim \
    the_silver_searcher \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    font-hack-nerd-font \
    font-fira-code-nerd-font \
    visual-studio-code \
    qlmarkdown

curl -s https://raw.githubusercontent.com/thors-beard/dotfiles/main/.vimrc -o ~/.vimrc
curl -s https://raw.githubusercontent.com/thors-beard/dotfiles/main/.zshrc -o ~/.zshrc
curl -s https://raw.githubusercontent.com/thors-beard/dotfiles/main/.zshrc -o ~/.ideavimrc
curl -s https://raw.githubusercontent.com/thors-beard/dotfiles/main/starship.toml -o ~/.config/starship.toml

curl -s "https://get.sdkman.io" | bash

git clone https://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh
