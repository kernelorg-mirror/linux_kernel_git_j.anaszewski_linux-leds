/* SPDX-License-Identifier: GPL-2.0 */
/*
 * This header provides macros for the common LEDs device tree bindings.
 *
 * Copyright (C) 2015, Samsung Electronics Co., Ltd.
 *
 * Author: Jacek Anaszewski <j.anaszewski@samsung.com>
 */

#ifndef __DT_BINDINGS_LEDS_H
#define __DT_BINDINGS_LEDS_H

/* External trigger type */
#define LEDS_TRIG_TYPE_EDGE	0
#define LEDS_TRIG_TYPE_LEVEL	1

/* Boost modes */
#define LEDS_BOOST_OFF		0
#define LEDS_BOOST_ADAPTIVE	1
#define LEDS_BOOST_FIXED	2

/* Standard LED functions */
#define LED_FUNCTION_ACTIVITY "activity"
#define LED_FUNCTION_ALARM "alarm"
#define LED_FUNCTION_BACKLIGHT "backlight"
#define LED_FUNCTION_BLUETOOTH "bluetooth"
#define LED_FUNCTION_BOOT "boot"
#define LED_FUNCTION_CHARGE "charge"
#define LED_FUNCTION_DEBUG "debug"
#define LED_FUNCTION_DISK "disk"
#define LED_FUNCTION_DISK_ERR "disk-err"
#define LED_FUNCTION_DISK_READ "disk-read"
#define LED_FUNCTION_DISK_WRITE "disk-write"
#define LED_FUNCTION_FAULT "fault"
#define LED_FUNCTION_FLASH "flash"
#define LED_FUNCTION_HEARTBEAT "heartbeat"
#define LED_FUNCTION_INDICATOR "indicator"
#define LED_FUNCTION_KBD_BACKLIGHT "kbd_backlight"
#define LED_FUNCTION_KEYBOARD "keyboard"
#define LED_FUNCTION_KEYPAD "keypad"
#define LED_FUNCTION_LAN "lan"
#define LED_FUNCTION_MMC "mmc"
#define LED_FUNCTION_NAND "nand"
#define LED_FUNCTION_ON "on"
#define LED_FUNCTION_PROGRAMMING "programming"
#define LED_FUNCTION_POWER "power"
#define LED_FUNCTION_RX "rx"
#define LED_FUNCTION_SD "sd"
#define LED_FUNCTION_STANDBY "standby"
#define LED_FUNCTION_STATUS "status"
#define LED_FUNCTION_TORCH "torch"
#define LED_FUNCTION_TV "tv"
#define LED_FUNCTION_TX "tx"
#define LED_FUNCTION_USB "usb"
#define LED_FUNCTION_WAN "wan"
#define LED_FUNCTION_WLAN "wlan"
#define LED_FUNCTION_WPS "wps"

#endif /* __DT_BINDINGS_LEDS_H */
