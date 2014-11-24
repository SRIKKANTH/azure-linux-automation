#!/bin/bash
#V-SHISAV@MICROSOFT.COM
# THIS SCRIPT DETECT FOLLOWING DISTROS:
#  UBUNTU [VERSION INDEPENDANT]
#  CENTOS [VERSION INDEPENDANT]
#  SUSE LINUX ENTERPRISE SERVER [VERSION INDEPENDANT]
#  OPENSUSE [VERSION INDEPENDANT]
#  REDHAT
#  ORACLELINUX
#  FEDORA
DetectDistro()
{
while echo $1 | grep ^- > /dev/null; do
    eval $( echo $1 | sed 's/-//g' | tr -d '\012')=$2
    shift
    shift
done
        if [ -e /etc/debian_version ]; then
                echo "UBUNTU"
                exitVal=0
        elif [ -e /etc/redhat-release ]; then
                tmp=`cat /etc/redhat-release`
                if [[ "$tmp" == *CentOS* ]]; then
                    echo "CENTOS"
                    exitVal=0
                elif [[ "$tmp" == *Red* ]]; then
                    echo "REDHAT"
                    exitVal=0
                elif [[ "$tmp" == *Fedora* ]]; then
                    echo "FEDORA"
                    exitVal=0				
                else
                    tmp=`cat /etc/system-release`
                    if [[ "$tmp" == *Oracle* ]]; then
                        echo "ORACLELINUX"
                        exitVal=0
                    else
                        echo "Unknown"
                        exitVal=1
                    fi
                fi
        elif [ -e /etc/SuSE-release ]; then
                tmp=`cat /etc/SuSE-release`
                if [[ "$tmp" == *Enterprise* ]]; then
                    echo "SLES"
                    exitVal=0
                elif [[ "$tmp" == *open* ]]; then
                    echo "SUSE"
                    exitVal=0
                else
                    echo "Unknown"
                fi
        fi
return $exitVal
}
DetectDistro