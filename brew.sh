#!/usr/bin/env bash

brew update
brew upgrade

brew install coreutils
brew install moreutils
brew install findutils

brew install gnu-sed --with-default-names

brew install atk
brew install cairo

brew install bash
brew install bash-completion2

if ! fgrep -q 'usr/local/bin/bash' /etc/shells; then
  echo 'usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

brew install wget --with-iri
brew install gnupg
brew install openssh

brew install grep
brew install ack
brew install fzf
brew install fd
brew install ripgrep

brew install python
brew install node
brew install rails

brew install yarn

brew tap homebrew/services

brew install httpd
brew install nginx
brew install mysql
brew install mongodb
brew install redis
brew install dnsmasq

brew install mcrypt
brew install speedtest

brew install composer

brew install tmux
brew install vim --with-override-system-vi
brew install mvim

brew install git
brew install git-flow
brew install git-lfs
brew install imagemagick --with-webp
brew install rename
brew install ssh-copy-id

brew cleanup
