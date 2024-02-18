#!/bin/bash
cd /minecraft/bin

ec2_public=$(curl -s http://checkip.amazonaws.com)
cat template.json | sed "s/#ip#/${ec2_public}/g" > update_ip.json
aws route53 change-resource-record-sets --hosted-zone-id Z00225471N6IHGI7T5IOX --change-batch file://update_ip.json
rm update_ip.json
cd ..
screen -dmS my_session java -Xmx1024M -Xms1024M -jar server.jar nog