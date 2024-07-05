sudo apt-get update
sudo apt-get upgrade
#Install snort
sudo apt-get install -y build-essential libpcap-dev libpcre3-dev libdumbnet-dev bison flex
cd /tmp
wget https://www.snort.org/downloads/snort/snort-2.9.15.tar.gz
tar -xvzf snort-2.9.15.tar.gz
cd snort-2.9.15
./configure
make
sudo make install
sudo mkdir /etc/snort
sudo mkdir /var/log/snort
sudo mkdir /usr/local/lib/snort_dynamicrules
sudo cp etc/* /etc/snort/
sudo cp etc/* /etc/snort/
