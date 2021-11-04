#!/bin/bash
echo -e "What would you like to use as the global password?"
read PASS
sed -i "s/replaceme/${PASS}/g" attack_range_local.conf
#echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
#sudo sysctl -p 
#sudo iptables -t nat -A PREROUTING -p tcp --dport 53 -j DNAT --to-destination 1.1.1.1:53
#sudo iptables -t nat -A PREROUTING -p udp --dport 53 -j DNAT --to-destination 1.1.1.1:53
#sudo iptables -t nat -A POSTROUTING -j MASQUERADE
sudo iptables -t nat -A OUTPUT -p udp --dport 53 -j DNAT --to 1.1.1.1:53
sudo iptables -t nat -A OUTPUT -p tcp --dport 53 -j DNAT --to 1.1.1.1:53
sudo apt-get update 
sudo apt-get install -y python3-dev python3-pip linux-headers-generic python-dev unzip python-pip virtualbox virtualbox-dkms python-virtualenv git ansible rpm
sudo gem install winrm-elevated
sudo gem install winrm
sudo ln -sfn /usr/bin/python3.6 /usr/bin/python
wget https://releases.hashicorp.com/vagrant/2.2.18/vagrant_2.2.18_x86_64.rpm
sudo rpm -ivh vagrant_2.2.18_x86_64.rpm
git clone https://github.com/splunk/attack_range_local
mv attack_range_local.conf attack_range_local/
cd attack_range_local
sudo python -m pip install -r requirements.txt
sudo ansible-galaxy collection install community.windows
chmod +x attack_range_local.py
sudo python attack_range_local.py -a build
