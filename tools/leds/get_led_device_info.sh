#!/bin/sh
# SPDX-License-Identifier: GPL-2.0

if [ $# -ne 1 ]; then
	echo "Usage: get_led_device_info.sh LED_CDEV_PATH"
	exit 1
fi

led_cdev_path=`echo $1 | sed s'/\/$//'`

ls "$led_cdev_path/brightness" > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "Device \"$led_cdev_path\" does not exist."
	exit 1
fi

bus=`readlink $led_cdev_path/device/subsystem | sed s'/.*\///'`
usb_subdev=`readlink $led_cdev_path | grep usb | sed s'/\(.*usb[0-9]*\/[0-9]*-[0-9]*\)\/.*/\1/'`
ls "$led_cdev_path/device/of_node/compatible" > /dev/null 2>&1
of_node_missing=$?

if [ "$bus" = "input" ]; then
	input_node=`readlink $led_cdev_path/device | sed s'/.*\///'`
	if [ ! -z $usb_subdev ]; then
		bus="usb"
	fi
fi

if [ "$bus" = "usb" ]; then
	usb_interface=`readlink $led_cdev_path | sed s'/.*\(usb[0-9]*\)/\1/' | cut -d \/ -f 3`
	driver=`readlink $usb_interface/driver | sed s'/.*\///'`
	cd $led_cdev_path/../$usb_subdev
	idVendor=`cat idVendor`
	idProduct=`cat idProduct`
	manufacturer=`cat manufacturer`
	product=`cat product`
elif [ "$bus" = "input" ]; then
	cd $led_cdev_path
	product=`cat device/name`
	driver=`cat device/device/driver/description`
elif [ $of_node_missing -eq 0 ]; then
	cd $led_cdev_path
	compatible=`cat device/of_node/compatible`
	if [ "$compatible" = "gpio-leds" ]; then
		driver="leds-gpio"
	elif [ "$compatible" = "pwm-leds" ]; then
		driver="leds-pwm"
	else
		manufacturer=`echo $compatible | cut -d, -f1`
		product=`echo $compatible | cut -d, -f2`
	fi
else
	echo "Unknown device type."
	exit 1
fi

printf "bus:\t\t\t$bus\n"

if [ ! -z "$idVendor" ]; then
	printf "idVendor:\t\t$idVendor\n"
fi

if [ ! -z "$idProduct" ]; then
	printf "idProduct:\t\t$idProduct\n"
fi

if [ ! -z "$manufacturer" ]; then
	printf "manufacturer:\t\t$manufacturer\n"
fi

if [ ! -z "$product" ]; then
	printf "product:\t\t$product\n"
fi

if [ ! -z "$driver" ]; then
	printf "driver:\t\t\t$driver\n"
fi

if [ ! -z "$input_node" ]; then
	printf "associated input node:\t$input_node\n"
fi
