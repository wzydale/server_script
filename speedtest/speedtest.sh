#!/bin/bash
TZ='Asia/Shanghai'
export TZ

rm speedtest.html
cat speedtestheader > speedtest.html
date >> speedtest.html
cat speedtestheader2 >> speedtest.html
./speedtest > result
date >> speedtest_log
sed 's/)/)<br>/g' result > result2
sed 's/Result/<br>Result/g' result2 > result3
sed 's/Server:/Server:<br>/g' result3 > result
cat result >> speedtest_log
cat result >> speedtest.html
rm result3
rm result2
cat speedtestfooter >> speedtest.html
rm /mnt/1twd/smbshare/os_daletech_cn/speedtest.html
cp ./speedtest.html /mnt/1twd/smbshare/os_daletech_cn/speedtest.html