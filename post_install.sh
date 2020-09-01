#!/bin/sh

# Prepare the system
pw useradd -n deluge -u 8675309 -m -c "Deluge BitTorrent Client" -s /usr/sbin/nologin -w no
mkdir -p /home/deluge/.config/deluge     
chown -R deluge:deluge /home/deluge/

mkdir /Downloads
chown deluge:deluge /Downloads

# Install the packages
pip install --upgrade pip
pip install deluge

# Install fix for https://dev.deluge-torrent.org/ticket/3278
patch -F 0 /usr/local/lib/python3.7/site-packages/deluge/argparserbase.py /usr/local/etc/deluge_changeset_1b4ac88ce.patch

# Configure the services
sysrc -f /etc/rc.conf deluged_enable="YES"
sysrc -f /etc/rc.conf deluged_user="deluge"

sysrc -f /etc/rc.conf deluge_web_enable="YES"
sysrc -f /etc/rc.conf deluge_web_user="deluge"

sysrc -f /etc/rc.conf openvpn_enable="YES"
sysrc -f /etc/rc.conf openvpn_if="tun"
sysrc -f /etc/rc.conf firewall_enable="YES"
sysrc -f /etc/rc.conf firewall_script="/usr/local/etc/openvpn/ipfw.rules"
sysrc -f /etc/rc.conf deluged_restart="YES"

echo "The initial password for the WebUI is: deluge" > /root/PLUGIN_INFO
echo "To change, login and you will be prompted." >> /root/PLUGIN_INFO
echo "The default download directory is: /Downloads" >> /root/PLUGIN_INFO
echo "Enable tunnel before using jail by running: iocage set allow_tun=1 deluge"
