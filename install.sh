#!/bin/sh
# Software for provisioning up a Macbook Pro and all that good stuff.
# Inspired by komputer-maschine by Lauren Dorman
# (https://github.com/laurendorman/komputer-maschine)
brew_install() {
    if test ! $(brew list --formula | grep $package); then
      brew install "$@"
    else
        echo '$package already installed, gonna skip that.'
    fi
}

cask_install() {
    if test ! $(brew list --cask | grep $application); then
      brew install --cask "$@"
    else
        echo '$application already installed, gonna skip that.'
    fi
}



# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# languages=(
#    go
# )

# for package in "$languages[@]"
#   do brew_install $package
# done

# Install brew caskroom
brew tap homebrew/cask


# Install applications
applications=(
    1password
    alfred
    dash
    caffeine
    google-chrome
    firefox
    insomnia
    slack
    docker
    spotify
    sequel-pro
    pgadmin4
	  visual-studio-code
)

for application in "${applications[@]}"
  do cask_install $application
done

# Install Node Version Manager (NVM)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | zsh

# Install latest
nvm install --lts




