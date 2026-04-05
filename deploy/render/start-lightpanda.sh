#!/bin/sh
set -eu

PORT="${PORT:-10000}"
LOG_LEVEL="${LIGHTPANDA_LOG_LEVEL:-info}"

exec /usr/local/bin/lightpanda serve \
  --host 0.0.0.0 \
  --port "$PORT" \
  --log-level "$LOG_LEVEL"
