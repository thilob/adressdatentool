#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$ROOT_DIR"

if [[ ! -x ".venv/bin/python" ]]; then
    echo "Fehler: .venv/bin/python wurde nicht gefunden."
    echo "Bitte zuerst eine virtuelle Umgebung anlegen und die Abhängigkeiten installieren."
    exit 1
fi

".venv/bin/python" main.py

if command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$ROOT_DIR/output" >/dev/null 2>&1 || true
fi
