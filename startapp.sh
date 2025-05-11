#!/bin/sh
set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.


mkdir -p /config/prism
# mkdir -p /config/multimc/MultiMC
# mkdir -p /config/multimc/MultiMC/bin
export HOME=/config/prism
cp /prism/PrismLauncher /config/prism/PrismLauncher
cp -r /prism/bin /config/prism/bin
cd $HOME
su prism
# exec cat
exec PrismLauncher
# exec minecraft-launcher

#debug
exec /usr/bin/xterm
