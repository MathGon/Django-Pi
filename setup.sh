#! /bin/bash

#
# djangopi
# ========
# A simple django installer for raspberry pi users.
#
# https://github.com/mathgon/Django-Pi
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
#

echo -e "\nUpdating all existing packages...\n"
apt-get -y update

echo -e "\nInstalling some essential stuff...\n"
echo -e "Installing python essentials\n"

apt-get install -y python-virtualenv
apt-get install -y python-pip

echo -e "\nInstalling nginx server...\n"
apt-get install -y openssh-server
apt-get install -y nginx


cd ..
virtualenv --no-site-packages .

pip install django-fab-deploy
apt-get install -y build-essential python-dev libmysqlclient-dev

cd DjangoPi/
. ../bin/activate

echo -e "Now we're going to install django and any other packages\n"
../bin/pip install -r requirements.txt

echo -e "\nFinally, lets make sure Django is installed properly - this will print the version number if successful\n"
python djangotest.py

deactivate

echo -e "\nDone!\n"
exit 0
