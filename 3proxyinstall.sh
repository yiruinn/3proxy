version=0.9.3
yum update && yum -y upgrade
yum install gcc make git -y
wget --no-check-certificate -O 3proxy-${version}.tar.gz https://github.com/z3APA3A/3proxy/archive/${version}.tar.gz
tar xzf 3proxy-${version}.tar.gz
cd 3proxy-${version}
make -f Makefile.Linux
cd src
mkdir /etc/3proxy/
mv 3proxy /etc/3proxy/
cd /etc/3proxy/
wget --no-check-certificate https://github.com/yiruinn/3proxy/raw/master/3proxy.cfg
chmod 600 /etc/3proxy/3proxy.cfg
mkdir /var/log/3proxy/
wget --no-check-certificate https://github.com/yiruinn/3proxy/raw/master/.proxyauth
chmod 600 /etc/3proxy/.proxyauth
cd /etc/init.d/
wget --no-check-certificate  https://raw.github.com/yiruinn/3proxy/master/3proxy
chmod  +x /etc/init.d/3proxy
chkconfig --add 3proxy
chkconfig 3proxy on
