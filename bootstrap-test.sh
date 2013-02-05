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
- kmachine::kms
- pivotal_workstation::vlc
EOF

#- roderik_workstation::bashrc
#- kmachine::kms


if [[ -d pivotal_workstation ]]; then
  cd pivotal_workstation && git pull && cd ..
else
  git clone https://github.com/jeffvincent/pivotal_workstation.git
fi
if [[ -d dmg ]]; then
  cd dmg && git pull && cd ..
else
  git clone https://github.com/opscode-cookbooks/dmg.git
fi
if [[ -d roderik_workstation ]]; then
  cd roderik_workstation && git pull && cd ..
else
  git clone https://github.com/jeffvincent/roderik_workstation.git
fi
soloist
