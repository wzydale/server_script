#!/bin/bash
#ip = curl https://api.ipify.org  后期加入IP提示以防止在错误的服务器上运行
echo "*** 欢迎使用Rsync下载站同步工具  ***"
echo "请确保此程序正在多伦多服务器运行"
echo "*****请选择同步类型*****"
echo "*1.多伦多 -> 中国 增量同步"
echo "*2.中国 -> 多伦多 增量同步"
echo "*****请输入数字选择*****"
read varname
if [ "$varname" == "1" ]
  then
    echo  "多伦多 -> 中国 增量同步开始..."
	cd /
    rsync -avze ssh /www/wwwroot/static.daletech.cn/* root@bj.wzydale.cn:../www/wwwroot/static.daletech.cn
elif [ "$varname" == "2" ]
  then
    echo  "中国 -> 多伦多 增量同步开始..."
	cd /
    rsync -avze ssh root@bj.wzydale.cn:/www/wwwroot/static.daletech.cn/* /www/wwwroot/static.daletech.cn/
else
    echo "输入错误，请重试"
fi
echo "***同步已完成***"
