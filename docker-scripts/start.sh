#!/bin/bash - 
#===============================================================================
#
#          FILE: start.sh
# 
#         USAGE: ./start.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 03/20/2015 18:00
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo "starting monit:"
/usr/bin/monit -d 10 -Ic /etc/monitrc
