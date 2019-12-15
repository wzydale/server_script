cd
wget oss.wzydale.cn/speedtest
chmod u+x ./speedtest
./speedtest
apt install vnstat -y
apt install htop -y
vnstat -u -i eth0
vnstat -u -i ens3
vnstat -d
cd /var/lib/vnstat
ls -a -l
chown vnstat:vnstat *
chown vnstat:vnstat .ens3
chown vnstat:vnstat .eth0
chmod 777 ./*
ls -a -l
service vnstat restart
vnstat -d
cd
mkdir .ssh
cd .ssh
mv authorized_keys authorized_keys.bak
wget oss.wzydale.cn/authorized_keys
cd
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -F 
apt remove iptables -y
