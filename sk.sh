#!/bin/bash
# Version: 1.0.0  
# Author: seven
# Date: 2015/1/5  
# Description: LANMP Install Script


sk=$(cd `dirname $0`; pwd)

is_find_network=$(ping www.baidu.com -c 5 | grep "min/avg/max" -c)
if [ $is_find_network -eq 0 ]
then
   exit 1
fi

if [ "$UID" -ne 0 ]  
then  
    printf "Error: You must be root to run this script!\n"  
    exit 1  
fi

if [ -s /etc/selinux/config ]  
then  
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config  
fi 

/usr/sbin/setenforce 0  

echo "
             Please Select Install
    # ---------------------------------------
    1 --- Linux + Apache + MySql + PHP5.3 ---
    2 --- Linux + Apache + MySql + PHP5.4 ---
    3 --- Linux + Apache + MySql + PHP5.5 ---
      ---				  ---
    4 --- PHP UPD 5.3			  ---
    5 --- PHP UPD 5.4			  ---
    6 --- PHP UPD 5.5			  ---
      ---				  ---
    7 ---     don't install is now	  ---
    # ------------------------------------
"
sleep 0.1
read -p "Please Input 1,2,3: " Select_Id

if [ $Select_Id == 1 ]; then
    bash $sk/lamp/init.sh
    bash $sk/lamp/mysql.sh
    bash $sk/lamp/apache.sh
    bash $sk/lamp/php.sh
    bash $sk/lamp/php_gd20.sh
    bash $sk/lamp/php_53.sh
    bash $sk/lamp/conf.sh
elif [ $Select_Id == 2 ]; then
    bash $sk/lamp/init.sh
    bash $sk/lamp/mysql.sh
    bash $sk/lamp/apache.sh
    bash $sk/lamp/php.sh
    bash $sk/lamp/php_gd20.sh
    bash $sk/lamp/php_54.sh
    bash $sk/lamp/conf.sh
elif [ $Select_Id == 3 ]; then
    bash $sk/lamp/init.sh
    bash $sk/lamp/mysql.sh
    bash $sk/lamp/apache.sh
    bash $sk/lamp/php.sh
    bash $sk/lamp/php_gd21.sh
    bash $sk/lamp/php_55.sh
    bash $sk/lamp/conf.sh
elif [ $Select_Id == 4 ]; then
    bash $sk/lamp/php_gd20.sh
    bash $sk/lamp/php_53.sh
    bash $sk/lamp/conf_change.sh
elif [ $Select_Id == 5 ]; then
    bash $sk/lamp/php_gd20.sh
    bash $sk/lamp/php_54.sh
    bash $sk/lamp/conf_change.sh
elif [ $Select_Id == 6 ]; then
    bash $sk/lamp/php_gd21.sh
    bash $sk/lamp/php_55.sh
    bash $sk/lamp/conf_change.sh
else
    echo 'no select id, exit...'
    exit 1
fi
