# iocage-plugin-deluge-pip
Artifact file(s) for Deluge iocage plugin

This plugin will install Deluge and its WebUI from the Python Package Index (PyPI)

This is based on the community Deluge plugin created by jsegaert but it adds OpenVPN.  Please note that you need to allow tunneling for this jail to function properly.  Also, openvpn.conf is for ProtonVPN's Iceland server, please change this file as well as auth.txt in /usr/local/etc/openvpn to your needs.

-----------THIS IS STILL WIP--------------

## To install this Plugin
Download the plugin manifest file to your local file system.
```
fetch https://raw.githubusercontent.com/blomstertj/iocage-myplugins/master/deluge-pip-openvpn.json
```
Install the plugin.  Adjust the network settings as needed.
```
iocage fetch -P deluge-pip-openvpn.json -n deluge
```



