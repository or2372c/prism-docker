#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.


mkdir -p /config/multimc
# mkdir -p /config/multimc/MultiMC
# mkdir -p /config/multimc/MultiMC/bin
export HOME=/config/multimc
cp /multimc/MultiMC /config/multimc/MultiMC
cp -r /multimc/bin /config/multimc/bin
cd $HOME

# exec cat
exec ./MultiMC
# exec minecraft-launcher
