#!/bin/sh
source ~/dotfiles/setup/functions.sh

fancy_echo "Setting up Unison"

pip install macfsevents
curl https://raw.githubusercontent.com/hnsl/unox/master/src/unox/unox.py | tee /usr/local/bin/unison-fsmonitor >/dev/null
chmod +x /usr/local/bin/unison-fsmonitor
pip install watchdog
