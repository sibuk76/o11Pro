#!/bin/sh
apt update
apt install unrar -y
wget https://www.dropbox.com/scl/fi/rd749ndevev3tiop4o2lx/ffmpeg.rar?rlkey=w2vb7pfp34xgizq0d22aqngyd&st=clf4ll7i&dl=0
unrar x ffmppeg.rar
cd ffmpeg/
mv ffmpeg /usr/local/bin/
mv ffprobe /usr/local/bin/
cd /root
wget https://github.com/sibuk76/o11Pro/raw/main/o11Pro.rar
unrar x o11Pro.rar /home
chmod -R +x /home/o11Pro/
wget https://raw.githubusercontent.com/sibuk76/o11Pro/main/o11Pro.service
chmod +x o11Pro.service
mv ./o11Pro.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable o11Pro.service
systemctl start o11Pro.service

echo "Installation Complete"
echo "Please login http://YOURIP:6060"
echo "USERNAME/PASSWORD admin admin"
