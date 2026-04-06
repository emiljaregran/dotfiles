#!/usr/bin/env zsh

brew update
brew upgrade
brew upgrade --cask

brew bundle install --file="./Brewfile"
brew cleanup
