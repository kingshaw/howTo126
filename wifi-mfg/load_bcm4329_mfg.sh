#!/system/bin/sh

# KS: don't let the host going to sleep mode ...
echo "mfg" > /sys/power/wake_lock

cd /system/lib/modules && insmod bcm4329.ko "firmware_path=/data/wifi-mfg/sdio-ag-mfgtest-seqcmds.bin nvram_path=/data/wifi-mfg/nvram.txt"


