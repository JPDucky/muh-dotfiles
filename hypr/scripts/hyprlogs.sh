#!/bin/bash

hypr_debug() {
  # Config paths
  LOG_DIR=$HOME/.hyprland/debug-logs

  # Make sure log dir exists
  mkdir -p "$LOG_DIR"

  # Clean old logs
  find "$LOG_DIR" -type f -name 'hyprland-*log' -mtime +7 -delete

  # Log file with date 
  LOG=$LOG_DIR/hyprland-$(date +%Y-%m-%d-%H-%M-%S).log
  
  # Check if debug=true
  if grep -q '^debug=true' "/path/to/hyprconfig"; then
    # Debug mode enabled, log everything
    exec 2>&1 | tee "$LOG"
  fi
}
