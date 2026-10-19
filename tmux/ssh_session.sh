#!/bin/bash

# Check if hostname was provided as input
if [ -z "$1" ]; then
  echo "Usage: $0 <hostname>"
  exit 1
fi

# Assign the input to a variable
HOSTNAME="$1"

# Check if a tmux session with the given hostname exists
if ! tmux has-session -t "$HOSTNAME" 2>/dev/null; then
  echo "No tmux session with the name '$HOSTNAME'. Creating a new one..."
  tmux new-session -d -s "$HOSTNAME" "ssh $HOSTNAME"
fi

# Attach to the tmux session
sesh connect "$HOSTNAME"
