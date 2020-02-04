#!/bin/bash
rm speedtest.html
cat speedtestheader > speedtest.html
echo date >>speedtest.html
cat speedtestheader2 >> speedtest.html
echo "Test Result" >> speedtest.html
cat speedtestfooter >> speedtest.html
rm /mnt/1twd/smbshare/os_daletech_cn/speedtest.html
cp ./speedtest.html /mnt/1twd/smbshare/os_daletech_cn/speedtest.html