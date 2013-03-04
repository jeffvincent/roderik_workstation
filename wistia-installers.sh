#!/bin/bash

if rvm --version 2>/dev/null; then
  gem install soloist
else
  sudo gem install soloist
fi

mkdir -p ~/cookbooks; cd ~/cookbooks

cat > soloistrc <<EOF
cookbook_paths:
- $PWD
recipes:
- pivotal_workstation::alfred
- pivotal_workstation::bash4
- pivotal_workstation::bash_completion
- pivotal_workstation::bash_it
- pivotal_workstation::chrome
- pivotal_workstation::coreutils
- pivotal_workstation::create_var_chef_cache
- pivotal_workstation::dropbox
- pivotal_workstation::findutils
- pivotal_workstation::firefox
- pivotal_workstation::gem_setup
- pivotal_workstation::git
- pivotal_workstation::github_ssh_keys
- pivotal_workstation::gnu-tar
- pivotal_workstation::homebrew
- pivotal_workstation::imagemagick
- pivotal_workstation::jpegoptim
- pivotal_workstation::locate_on
- pivotal_workstation::memcached
- pivotal_workstation::nginx
- pivotal_workstation::node_js
- pivotal_workstation::oh_my_zsh
- pivotal_workstation::optipng
- pivotal_workstation::postgres
- pivotal_workstation::pwgen
- pivotal_workstation::redis
- pivotal_workstation::rvm
- pivotal_workstation::sequelpro
- pivotal_workstation::siege
- pivotal_workstation::tmux
- pivotal_workstation::unhide_home
- pivotal_workstation::vlc
- pivotal_workstation::watch
- pivotal_workstation::wget
- pivotal_workstation::xquartz
- roderik_workstation::inputrc
- pivotal_workstation::heroku_toolbelt
- pivotal_workstation::zsh
- pivotal_workstation::mysql
- pivotal_workstation::right_zoom
- pivotal_workstation::iterm2
- pivotal_workstation::vim
EOF

if [[ -d pivotal_workstation ]]; then
  cd pivotal_workstation && git pull && cd ..
else
  git clone https://github.com/roderik/pivotal_workstation.git
fi
if [[ -d dmg ]]; then
  cd dmg && git pull && cd ..
else
  git clone https://github.com/opscode-cookbooks/dmg.git
fi
if [[ -d roderik_workstation ]]; then
  cd roderik_workstation && git pull && cd ..
else
  git clone https://github.com/roderik/roderik_workstation.git
fi
if [[ -d oh-my-zsh-chef ]]; then
  cd oh-my-zsh-chef && git pull && cd ..
else
  git clone https://github.com/shingara/oh-my-zsh-chef.git
fi

soloist
