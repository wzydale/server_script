#!/bin/bash
ip = curl https://api.ipify.org
echo "*** 欢迎使用Rsync下载站同步工具  ***"
echo "请确保此程序正在美国服务器运行"
echo "*****请选择同步类型*****"
echo "*1.美国 -> 中国 增量同步"
echo "*2.中国 -> 美国 增量同步"
echo "*3.双向同步            "
echo "*****请输入数字选择*****"
read varname
if [ "$varname" == "1" ]
  then
    echo  "美国 -> 中国 增量同步开始..."
    rsync -avze ssh ../mnt/blockstorage/usdl.wzydale.cn/* root@bj.wzydale.cn:../www/wwwroot/dl.wzydale.cn
elif [ "$varname" == "2" ]
  then
    echo  "中国 -> 美国 增量同步开始..."
    rsync -avze ssh root@bj.wzydale.cn:../www/wwwroot/dl.wzydale.cn/* ../mnt/blockstorage/usdl.wzydale.cn/
elif [ "$varname" == "3" ]
  then
    echo  "双向同步开始..."
    rsync -avze ssh ../mnt/blockstorage/usdl.wzydale.cn/* root@bj.wzydale.cn:../www/wwwroot/dl.wzydale.cn    
    rsync -avze ssh root@bj.wzydale.cn:../www/wwwroot/dl.wzydale.cn/* ../mnt/blockstorage/usdl.wzydale.cn/
else
    echo "输入错误，请重试"
fi

echo "***同步已完成***"
