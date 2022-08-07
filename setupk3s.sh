sudo apt install iptables -y
sudo iptables -F
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
sudo echo cgroup_memory=1 cgroup_enable=memory >> /boot/cmdline.txt
sudo reboot