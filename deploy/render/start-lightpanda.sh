#!/bin/sh
set -eu

PORT="${PORT:-10000}"
LOG_LEVEL="${LIGHTPANDA_LOG_LEVEL:-info}"
ADVERTISE_HOST="${LIGHTPANDA_ADVERTISE_HOST:-${RENDER_EXTERNAL_HOSTNAME:-}}"

if [ -n "$ADVERTISE_HOST" ]; then
  exec /usr/local/bin/lightpanda serve \
    --host 0.0.0.0 \
    --port "$PORT" \
    --advertise-host "$ADVERTISE_HOST" \
    --log-level "$LOG_LEVEL"
fi

exec /usr/local/bin/lightpanda serve \
  --host 0.0.0.0 \
  --port "$PORT" \
  --log-level "$LOG_LEVEL"
