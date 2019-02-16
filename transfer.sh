#!/bin/bash
echo "*** 欢迎使用Wget.daletech.cn文件传输工具  ***"


if [ $argc -eq 2 ]
  then
       # write to output to tmpfile because of progress bar
       curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) | tee /dev/null
else
       echo 'usage: transfer FILE_TO_TRANSFER'
fi
	

echo "***同步已完成***"
