#!/bin/bash

# Remove old tmpfs entries for o11Pro
sed -i '\|/home/o11Pro/hls|d' /etc/fstab
sed -i '\|/home/o11Pro/dl|d' /etc/fstab

sleep 2

# Ensure directories exist
mkdir -p /home/o11Pro/hls
mkdir -p /home/o11Pro/dl

# Append tmpfs entries
cat <<'EOL' >> /etc/fstab

tmpfs /home/o11Pro/hls tmpfs rw,noatime,nosuid,nodev,noexec,mode=1777,size=25% 0 0
tmpfs /home/o11Pro/dl  tmpfs rw,noatime,nosuid,nodev,noexec,mode=1777,size=25% 0 0
EOL

# Mount everything
mount -av