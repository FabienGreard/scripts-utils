#!/usr/bin/env node

function helper {
  echo "Usage: $0 [options]"
  echo ""
  echo "Options:"
  echo "-r, --restart Restart all processes"
  echo "-s, --stop Stop all processes",
  echo " -i, --install start installing mongodb"
  echo "-c, --clear mongodb"
}

function clear {
  sudo service mongod stop -y
  sudo apt-get purge mongodb-org* -y
  sudo rm -r /var/log/mongodb -y
  sudo rm -r /var/lib/mongodb -y
}

function install {
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 -y
  echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list -y
  sudo apt-get update -y
}

while true; do
  case $1 in
    -r | --restart)
    sudo service mongod restart
    ;;
    -s | --stop)
    sudo service mongod stop
    ;;
    *)
    -i | --install)
    install
    ;;
    *)
    -c | --clear)
    clear
    ;;
    *)
    helper
    ;;
  esac
  exit 0
done
