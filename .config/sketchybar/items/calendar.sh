#!/bin/bash

sketchybar --add item calendar right \
           --set calendar icon=􀧞  \
                          label="$(date +'%a %d %b %I:%M %p')" \
                          update_freq=30 \
                          script="$PLUGIN_DIR/calendar.sh"
