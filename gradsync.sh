#!/bin/bash
#ip = curl https://api.ipify.org  后期加入IP提示以防止在错误的服务器上运行
echo "*** 毕业典礼视频站同步工具  ***"
echo "请确保此程序正在香港服务器运行"
echo "*****请选择同步类型*****"
echo "*1.香港 -> 美国 增量同步"
echo "*2.美国 -> 香港 增量同步"
echo "*****请输入数字选择*****"
read varname
if [ "$varname" == "1" ]
  then
    echo  "香港 -> 美国 增量同步开始..."
	cd /
    rsync -avze ssh /www/wwwroot/grad.czss.ca/* root@sg.daletech.ltd:../www/wwwroot/grad.czss.ca
elif [ "$varname" == "2" ]
  then
    echo  "美国 -> 香港 增量同步开始..."
	cd /
    rsync -avze ssh root@sg.daletech.ltd:/www/wwwroot/grad.czss.ca/* /www/wwwroot/grad.czss.ca/
else
    echo "输入错误，请重试"
fi
echo "***同步已完成***"
