#!/bin/bash
sudo sensors-detect --auto
sudo cat <<EOT > /etc/fancontrol
INTERVAL=10
DEVPATH=hwmon1=devices/pci0000:00/0000:00:01.0/0000:01:00.0
DEVNAME=hwmon1=amdgpu
FCTEMPS=hwmon1/pwm1=hwmon1/temp1_input
FCFANS= hwmon1/pwm1=hwmon1/fan1_input
MINTEMP=hwmon1/pwm1=46
MAXTEMP=hwmon1/pwm1=85
MINSTART=hwmon1/pwm1=150
MINSTOP=hwmon1/pwm1=0
MAXPWM=hwmon1/pwm1=255
EOT
sudo systemctl enable fancontrol
sudo systemctl start fancontrol