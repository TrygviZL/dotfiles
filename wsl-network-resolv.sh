# fix possible vpm routing issue
sudo rm -rf /etc/resolv.conf
sudo tee /etc/resolv.conf << EOF
search yourbase.domain.local
nameserver 8.8.8.8
nameserver 1.1.1.1
EOF

sudo tee /etc/wsl.conf << EOF
[network]
generateResolvConf=false
EOF

echo "Remember to restart wsl by running wsl --shutdown in powershell"
