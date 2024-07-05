# my-NIDS-Server-
# Network Intrusion Detection System (NIDS) with Raspberry Pi and Snort

## Overview

This project involves setting up a Network Intrusion Detection System (NIDS) using a Raspberry Pi and Snort. The system monitors network traffic and detects suspicious activities, providing alerts for potential security threats. This project demonstrates practical skills in network security, system administration, and real-time monitoring.

## Features

- **Intrusion Detection**: Detects various types of network attacks and suspicious activities.
- **Custom Rules**: Allows for the creation of custom Snort rules to tailor the detection system to specific needs.
- **Real-Time Alerts**: Provides real-time alerts for detected intrusions.
- **Low-Cost**: Utilizes a Raspberry Pi, making it a cost-effective solution for home or small business network security.

## Requirements

- **Hardware**:
  - Raspberry Pi 4 (or 3)
  - MicroSD Card (32GB or higher)
  - Power Supply for Raspberry Pi
  - Ethernet Cable
  - USB Keyboard and Mouse
  - Monitor
  - Raspberry Pi Case (optional)

- **Software**:
  - Raspberry Pi OS
  - Snort

## Installation

### Step 1: Set Up Raspberry Pi

1. **Install Raspberry Pi OS**:
   - Download the latest Raspberry Pi OS from the [official website](https://www.raspberrypi.org/software/).
   - Use software like [balenaEtcher](https://www.balena.io/etcher/) to flash the OS image onto the microSD card.
   
2. **Initial Boot**:
   - Insert the microSD card into the Raspberry Pi.
   - Connect the Raspberry Pi to the monitor, keyboard, and mouse.
   - Power on the Raspberry Pi and follow the on-screen instructions to complete the initial setup.

### Step 2: Update and Upgrade
```sh
sudo apt-get update
sudo apt-get upgrade
```
Open the terminal on your Raspberry Pi and run the following commands:

### Step 3: Install Snort

Install dependencies:
```sh
sudo apt-get install -y build-essential libpcap-dev libpcre3-dev libdumbnet-dev bison flex
```

### Step 4: Download and install Snort
```sh
cd /tmp
wget https://www.snort.org/downloads/snort/snort-2.9.15.tar.gz
tar -xvzf snort-2.9.15.tar.gz
cd snort-2.9.15
./configure
make
sudo make install
```

### Step 4: Configure Snort
Create directories for Snort configuration and logs:

```sh
sudo mkdir /etc/snort
sudo mkdir /var/log/snort
sudo mkdir /usr/local/lib/snort_dynamicrules

echo Copy the configuration files to snort files:
sudo cp etc/* /etc/snort/
```
### Step 5: Edit the snort.conf file:

```sh
sudo nano /etc/snort/snort.conf

var HOME_NET 192.168.1.0/24
echo Uncomment and set the rule path:

include $RULE_PATH/local.rules
```
### Step 6: Test Snort
Create a simple test rule:
```sh
Copy code
sudo nano /etc/snort/rules/local.rules
```
**Add the following rule:**
```sh
alert icmp any any -> $HOME_NET any (msg:"ICMP test detected"; sid:1000001; rev:1;)
```
Run Snort in test mode:
```sh
sudo snort -T -c /etc/snort/snort.conf
```
### Step 6: Run Snort

Start Snort to monitor network traffic:
```sh
sudo snort -A console -q -c /etc/snort/snort.conf -i eth0
```
