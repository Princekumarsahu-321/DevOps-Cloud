#!/usr/bin/env bash
set -Eeuo pipefail

url="${1:-http://localhost:5000/health}"
requests="${2:-25}"

if ! [[ "$requests" =~ ^[1-9][0-9]*$ ]] || ((requests > 1000)); then
  echo "Request count must be an integer between 1 and 1000." >&2
  exit 2
fi

echo "Sending $requests sequential requests to $url"
for ((request = 1; request <= requests; request++)); do
  curl --fail --silent --show-error --max-time 10 \
    --output /dev/null \
    --write-out "request=$request status=%{http_code} duration=%{time_total}s\n" \
    "$url"
done