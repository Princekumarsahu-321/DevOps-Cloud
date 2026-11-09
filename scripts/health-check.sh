#!/usr/bin/env bash
set -Eeuo pipefail

url="${1:-http://localhost:5000/health}"
attempts="${HEALTH_CHECK_ATTEMPTS:-5}"

if ! [[ "$attempts" =~ ^[1-9][0-9]*$ ]]; then
  echo "HEALTH_CHECK_ATTEMPTS must be a positive integer." >&2
  exit 2
fi

for ((attempt = 1; attempt <= attempts; attempt++)); do
  if curl --fail --silent --show-error --max-time 5 "$url"; then
    printf '\nHealth check passed: %s\n' "$url"
    exit 0
  fi

  if ((attempt < attempts)); then
    echo "Attempt $attempt/$attempts failed; retrying in 2 seconds..." >&2
    sleep 2
  fi
done

echo "Health check failed after $attempts attempts: $url" >&2
exit 1