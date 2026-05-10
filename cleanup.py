#!/usr/bin/env python3

import os
import time
from pathlib import Path

# Parent directory containing multiple subfolders
TARGET_DIR = "/home/o11Pro/hls/live"

# Files older than this many seconds will be deleted
AGE_LIMIT = 60  # 1 minute

now = time.time()

for root, dirs, files in os.walk(TARGET_DIR):
    for file in files:
        file_path = Path(root) / file

        # Skip .m3u8 files
        if file_path.suffix == ".m3u8":
            continue

        try:
            file_mtime = file_path.stat().st_mtime

            if now - file_mtime > AGE_LIMIT:
                print(f"Deleting: {file_path}")
                file_path.unlink()

        except Exception as e:
            print(f"Error deleting {file_path}: {e}")