#!/bin/bash
set -e

### dependencies
yum install -y zlib-devel bzip2-devel openssl-devel sqlite-devel ncurses-devel
yum install -y gcc gcc-gfortran gcc-c++ blas-devel lapack-devel atlas-devel

### install python-2.7.11
mkdir -p tmp
cd tmp
if [ -f Python-2.7.11.tgz ]; then
    p=$(readlink -f Python-2.7.11.tgz)
    echo "$p is found."
else
    wget -q https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz
fi
tar xzf Python-2.7.11.tgz
cd Python-2.7.11
./configure --prefix=/usr/local
make
make altinstall

### install & upgrade pip
/usr/local/bin/python2.7 -m ensurepip --upgrade
/usr/local/bin/pip2.7 install --upgrade pip

### install nose nose2 for code testing
/usr/local/bin/pip2.7 install --upgrade nose nose2

### install virtualenv
/usr/local/bin/pip2.7 install --upgrade virtualenv

### install numpy, scipy, sklearn
/usr/local/bin/pip2.7 install --upgrade numpy scipy sklearn


### references 
# https://www.digitalocean.com/community/tutorials/how-to-set-up-python-2-7-6-and-3-3-3-on-centos-6-4
# https://github.com/h2oai/h2o-2/wiki/Installing-python-2.7-on-centos-6.3.-Follow-this-sequence-exactly-for-centos-machine-only
# https://docs.python.org/2/library/ensurepip.html
# http://scikit-learn.org/stable/developers/advanced_installation.html

