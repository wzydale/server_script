#!/bin/bash
#ip = curl https://api.ipify.org  后期加入IP提示以防止在错误的服务器上运行
echo "*** 欢迎使用Wget.daletech.cn文件传输工具  ***"



if [ $argv[1] ]
       # write to output to tmpfile because of progress bar
       set -l tmpfile ( mktemp -t transferXXX )
       curl --progress-bar --upload-file "$argv[1]" http://wget.daletech.cn:8080/(basename $argv[1]) >> $tmpfile
       cat $tmpfile
       command rm -f $tmpfile
else
       echo 'usage: transfer FILE_TO_TRANSFER'
fi
	

echo "***同步已完成***"
