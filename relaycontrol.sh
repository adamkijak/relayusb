#!/bin/sh

sudo chmod o+rw /dev/ttyUSB0

stty -F /dev/ttyUSB0 9600 -cstopb -parenb

function  on1(){ echo 1 > /dev/ttyUSB0; }
function  on2(){ echo 4 > /dev/ttyUSB0; }
function off1(){ echo 0 > /dev/ttyUSB0; }
function off2(){ echo 3 > /dev/ttyUSB0; }

function offall(){ off1 ; off2 ; }
function  onall(){  on1 ; on2  ; }

function status1()
{
    local STATUS
    ((sleep 0.1 ; echo -e '2\n\r\0' > /dev/ttyUSB0 )& )  ; read -n 1 STATUS < /dev/ttyUSB0 ; echo $STATUS
}

function status2()
{
    local STATUS
    ((sleep 0.1 ; echo -e '5\n\r\0' > /dev/ttyUSB0 )& )  ; read -n 1 STATUS < /dev/ttyUSB0 ; echo $STATUS
}
