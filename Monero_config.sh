#!/bin/bash

MoneroAddress="46K93J1S1yo4kpDVX3QGFbduvDemyr99s5DsDgijQ49NUSwRjs2aKAdRJvnevH5V3rGPyj4nSmzSAYepNHkuRvYRMiASEQx"

echo "Enter Worker name:";
read WorkerName;

# Update the system
apt update && apt upgrade -y

# Install required dependencies
apt install wget screen -y

# Download the precompiled XMRig binary for Linux
wget https://github.com/xmrig/xmrig/releases/download/v6.20.0/xmrig-6.20.0-linux-x64.tar.gz

# Extract the downloaded archive
tar -xvf xmrig-6.20.0-linux-x64.tar.gz

# Navigate to the extracted directory
cd xmrig-6.20.0

# Start XMRig in the background using screen
screen -dmS xmr ./xmrig --donate-level 1 -o pool.hashvault.pro:80 -u $MoneroAddress -p $WorkerName -a rx/0 -k

echo "echo \"-------------------------------------------------------------------------------------------\"" >> helpmonero;
echo "echo \"|  Enter 'screen -r xmr' to see the screen                                                |\"" >> helpmonero;
echo "echo \"|  crtl + a + d to exit                                                                   |\"" >> helpmonero;
echo "echo \"|  If instance restart Enter 'rm -rf *' to delete all and than re-run all                 |\"" >> helpmonero;
echo "echo \"-------------------------------------------------------------------------------------------\"" >> helpmonero;
chmod 755 helpmonero;
./helpmonero