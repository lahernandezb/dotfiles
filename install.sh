#!/bin/sh
# Software for provisioning up a Macbook Pro and all that good stuff.
# Inspired by komputer-maschine by Lauren Dorman
# (https://github.com/laurendorman/komputer-maschine)
brew_install() {
    if test ! $(brew list | grep $package); then
      brew install "$@"
    else
        echo '$package already installed, gonna skip that.'
    fi
}

cask_install() {
    if test ! $(brew cask list | grep $application); then
      brew install "$@"
    else
        echo '$application already installed, gonna skip that.'
    fi
}



# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


packages=(
    wget
    curl
    git
    nvm
)

for package in "$packages[@]"
  do brew_install $package
done

languages=(
    go
)

for package in "$languages[@]"
  do brew_install $package
done

# Install brew caskroom
brew tap caskroom/cask
brew tap caskroom/fonts

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
)

for application in "$applications[@]"
  echo "installing $application"
  do cask_install $application
done

# Install Node Version Manager (NVM)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | zsh

# Install latest
nvm install stable
nvm alias default stable



