#!/usr/bin/env bash

set -euo pipefail

usage() {
  echo "Usage: $0 [explain]" >&2
}

explain=false

if [[ $# -gt 1 ]]; then
  usage
  exit 1
fi

if [[ $# -eq 1 ]]; then
  if [[ "$1" == "explain" ]]; then
    explain=true
  else
    usage
    exit 1
  fi
fi

cpu_usage() {
  local idle1 total1 idle2 total2

  read -r _ user1 nice1 system1 idle1 iowait1 irq1 softirq1 steal1 _ < /proc/stat
  total1=$((user1 + nice1 + system1 + idle1 + iowait1 + irq1 + softirq1 + steal1))
  idle1=$((idle1 + iowait1))

  sleep 1

  read -r _ user2 nice2 system2 idle2 iowait2 irq2 softirq2 steal2 _ < /proc/stat
  total2=$((user2 + nice2 + system2 + idle2 + iowait2 + irq2 + softirq2 + steal2))
  idle2=$((idle2 + iowait2))

  awk -v total1="$total1" -v total2="$total2" -v idle1="$idle1" -v idle2="$idle2" 'BEGIN {
    total_delta = total2 - total1
    idle_delta = idle2 - idle1
    if (total_delta <= 0) {
      print 0
    } else {
      printf "%.0f", (100 * (1 - (idle_delta / total_delta)))
    }
  }'
}

memory_usage() {
  free | awk '/Mem:/ {printf "%.0f", ($3 / $2) * 100}'
}

disk_usage() {
  df -P / | awk 'NR==2 {gsub(/%/, "", $5); print $5}'
}

cpu_percent="$(cpu_usage)"
memory_percent="$(memory_usage)"
disk_percent="$(disk_usage)"

healthy=true
reason=""

if (( cpu_percent > 60 )); then
  healthy=false
  reason+="CPU usage is ${cpu_percent}% which is above 60%. "
fi

if (( memory_percent > 60 )); then
  healthy=false
  reason+="Memory usage is ${memory_percent}% which is above 60%. "
fi

if (( disk_percent > 60 )); then
  healthy=false
  reason+="Disk usage is ${disk_percent}% which is above 60%. "
fi

if $healthy; then
  echo "Health Status: Healthy"
  if $explain; then
    echo "Reason: CPU ${cpu_percent}%, Memory ${memory_percent}%, Disk ${disk_percent}% are all at or below 60%."
  fi
else
  echo "Health Status: Not healthy"
  if $explain; then
    echo "Reason: ${reason% }"
  fi
fi
