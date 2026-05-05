#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

case "${1:-up}" in
  up)
    docker compose up -d
    echo "Open WebUI available at http://localhost:3000"
    ;;
  down)
    docker compose down
    ;;
  restart)
    docker compose down
    docker compose up -d
    ;;
  logs)
    docker compose logs -f
    ;;
  *)
    echo "Usage: $0 [up|down|restart|logs]"
    exit 1
    ;;
esac
