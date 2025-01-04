#!/bin/bash

# Terminate already running polybars
# Can use the following if all polybars have ipc enabled
polybar-msg cmd quit

# Otherwise use the nuclear option:
# killall -q polybar

echo "---" | tee -a /tmp/polybar.log

polybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
