#!/bin/bash
rm speedtest.html
cat speedtestheader > speedtest.html
date >> speedtest.html
cat speedtestheader2 >> speedtest.html
cat resultbak > result
date >> speedtest_log
sed 's/)/)<br>/g' result > result2
sed 's/Result/Result<br>/g' resul2 > result3
sed 's/ by Ookla t/ /g' resul3 > result
cat result >> speedtest_log
cat result >> speedtest.html
rm result3
rm result2
cat speedtestfooter >> speedtest.html
rm /mnt/1twd/smbshare/os_daletech_cn/speedtest.html
cp ./speedtest.html /mnt/1twd/smbshare/os_daletech_cn/speedtest.html