#!/system/bin/sh

# need to be root first ...

# Don't let the host go to sleep mode ...
echo "adb" > /sys/power/wake_lock
echo "... /sys/power/wake_lock is set"

# Load the driver
load_bcm4329.sh
echo "... bcm4329 driver loaded"

# Bring up network interface
ifconfig eth0 192.168.1.2

# Turn off bcm43239's power control
wl mpc 0

# Associate to AP
wl join brap

# Prepare for ADB over Wifi
setprop service.adb.tcp.port 5555
stop adbd
start adbd
echo "... adb over wifi is set"
echo "... on the host, do:"
echo "   $> export ADBHOST=192.168.1.2"
echo "   $> adb kill-server"
echo "   $> adb start-server"
echo "   $> adb shell"





