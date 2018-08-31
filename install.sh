#!/usr/bin/env bash

# Will install dependency and basic feature (only works for debian and Ubuntu based Linux distributions)
function display {
  echo "````````````"
  echo "$1"
  echo "````````````"
}

function install {
  display "Apt-get Update"
  sudo apt-get -y update

  display "Install curl"
  sudo apt-get -y install curl

  display "Install nano"
  sudo apt-get -y install nano

  display "Install git"
  sudo apt-get -y install git

  display "Install nodejs"
  sudo apt-get -y install nodejs

  display "Install npm"
  sudo apt-get -y install npm

  # Update npm
  sudo npm install npm@latest -g

  # Update node
  sudo npm cache clean -f
  sudo npm install -g n
  sudo n 10.1.0

  # Yarn
  sudo npm install yarn -g

  # Rimraf
  sudo npm install rimraf -g

  # Pm2
  npm install pm2@latest -g

  # Allow npm compil install
  sudo apt install -y build-essential

  display "Done"
}

function clear {
  display "Delete curl"
  sudo apt-get purge --auto-remove -y curl

  display "Delete nano"
  sudo apt-get purge --auto-remove -y nano

  display "Install git"
  sudo apt-get purge --auto-remove -y git

  display "Delete node and npm"
  sudo apt-get purge --auto-remove -y nodejs
  sudo rm -rf /usr/local/{lib/node{,/.npm,_modules},bin,share/man}/{npm*,node*,man1/node*}
  sudo rm -rf /opt/local/bin/node /opt/local/include/node /opt/local/lib/node_modules
  sudo rm -rf /usr/local/bin/npm /usr/local/share/man/man1/node.1 /usr/local/lib/dtrace/node.d

  display "Delete hyper"
  sudo apt-get purge --auto-remove -y hyper

  display "Done"
}

function reset {
  clean
  install
}

function helper {
  echo "Usage: $0 [OPTIONS]"
  echo ""
  echo "OPTIONS:"
  echo " -i, --install start installing dependency and basic feature"
  echo "-c, --clean clean each dependency and feaure"
  echo "-i, --reset will launch a --clean command and a --install command"
}

while true; do
  case $1 in
    -i | --install)
    install
    ;;
    -c | --clear)
    clear
    ;;
    -r | --reset)
    reset
    ;;
    *)
    helper
    ;;
  esac
  exit 0
done
