#!/bin/bash
set -e

# slow DNS resolution leading to timeouts when using Vagrant
if [ ! $(grep 'single-request-reopen' /etc/sysconfig/network) ]; then
    echo 'RES_OPTIONS=single-request-reopen' >> /etc/sysconfig/network && service network restart
fi
