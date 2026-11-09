#!/usr/bin/env bash
# Docker 없이 정적 파일을 서빙한다 (python3 필요).
# 사용법: PORT=8080 HOST=0.0.0.0 ./serve.sh
set -euo pipefail
cd "$(dirname "$0")"
PORT="${PORT:-8080}"
HOST="${HOST:-0.0.0.0}"
echo "Serving $(pwd) on http://${HOST}:${PORT}"
exec python3 -m http.server "$PORT" --bind "$HOST"
