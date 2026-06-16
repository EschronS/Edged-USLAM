#!/bin/bash

sr
BAGPATH="${1:-$(find /home/bags -name '*.bag' | fzf)}"
BAGNAME=$(basename "$BAGPATH" .bag)
LOGPATH="/tmp/${BAGNAME}_$(date '+%F_%H-%M-%S')/"
mkdir -p /tmp/edged_uslam_run
roslaunch ze_vio_ceres dvx_micro_events_only.launch bag_filename:="${BAGPATH}"
mkdir -p "$LOGPATH"
cp /tmp/edged_uslam_run/* "$LOGPATH"
