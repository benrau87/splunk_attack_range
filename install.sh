#!/bin/bash
sudo apt-get update 
sudo apt-get install -y python3-dev python3-pip linux-headers-generic python-dev unzip python-pip vagrant virtualbox virtualbox-dkms python-virtualenv git
sudo gem install winrm-elevated
sudo gem install winrm
git clone https://github.com/splunk/attack_range_local && cd attack_range_local
ln -sfn /usr/bin/python3.6 /usr/bin/python
python -m pip install -r requirements.txt
ansible-galaxy collection install community.windows
chmod +x attack_range_local.py
