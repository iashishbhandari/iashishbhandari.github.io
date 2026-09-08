#!/usr/bin/env bash
# Local preview for the sales page. Run: ./serve.sh   (then open http://localhost:8080)
PORT="${1:-8080}"
cd "$(dirname "$0")" || exit 1
echo "Serving $(pwd) at http://localhost:$PORT  —  Ctrl+C to stop"
python3 -m http.server "$PORT" --bind 127.0.0.1
