#!/bin/sh

if [ $# != 2 ]; then
    echo Failed!!! e.g)sh 99_config.sh eth0 48: $*
    exit 1
else
    echo $1 $2
fi


cat <<-EOF > /etc/netplan/99_config.yaml
network:
\tversion: 2
\trenderer: networkd
\tethernets:
\t\t$1:
\t\t\tdhcp4: false
\t\t\tdhcp6: false
\t\t\taddresses: [192.168.1.$2/24]
\t\t\tgateway4: 192.168.1.1
\t\t\tnameservers:
\t\t\t\taddresses: [192.168.1.1]
EOF

netplan try --timeout 10
