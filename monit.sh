#!/usr/bin/env bash

function helper {
  echo "Usage: $0 [OPTIONS]"
  echo ""
  echo "OPTIONS:"
  echo "-r, --restart Restart all processes"
  echo "-s, --stop Stop all processes"
}

while true; do
  case $1 in
    -r | --restart)
    sudo pm2 restart all
    ;;
    -s | --stop)
    sudo pm2 stop all
    ;;
    *)
    helper
    ;;
  esac
  exit 0
done
