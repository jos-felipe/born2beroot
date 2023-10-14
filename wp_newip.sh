#!/bin/bash

# Run this shell script at system startup with cron (@reboot) to update Wordpress site ip
nic="en0"
ip_addr=$(ifconfig $nic | grep -w 'inet' | awk '{print $2}')
url=http://$ip_addr
#cat wp_conf.php | sed "s|site_url =.*|site_url = $url|"
sed -i.bak "s|site_url =.*|site_url = $url|" wp_conf.php
