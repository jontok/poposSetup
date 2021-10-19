#!/bin/bash
dd bs=4M if=/dev/sdb of=/home/$USER/Documents/Projects/raspiimage.img status=progress
