# Editing and adding rules in the snort conf
```sh
 sudo nano /etc/snort/snort.conf
var HOME_NET 192.168.1.0/24
include $RULE_PATH/local.rules
sudo nano /etc/snort/rules/local.rules
alert icmp any any -> $HOME_NET any (msg:"ICMP test detected"; sid:1000001; rev:1;)
```
