cd
wget oss.wzydale.cn/speedtest
chmod u+x ./speedtest
./speedtest
apt update -y
apt upgrade -y
apt autoremove -y
apt install landscape-common -y
apt install vnstat -y
apt install htop -y
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

