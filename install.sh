#!/bin/bash
sudo apt-get update 
sudo apt-get install -y python3-dev python3-pip linux-headers-generic rpm python-dev unzip python-pip virtualbox virtualbox-dkms python-virtualenv git ansible
sudo gem install winrm-elevated
sudo gem install winrm
sudo rpm -ivh vagrant_2.2.7_x86_64.rpm
git clone https://github.com/splunk/attack_range_local && cd attack_range_local
sudo ln -sfn /usr/bin/python3.6 /usr/bin/python
sudo python -m pip install -r requirements.txt
sudo ansible-galaxy collection install community.windows
chmod +x attack_range_local.py
sudo python attack_range_local.py -a build
