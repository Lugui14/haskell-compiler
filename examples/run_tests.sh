#!/usr/bin/env bash
set -eu
HERE="$(cd "$(dirname "$0")" && pwd)"
PARENT="$HERE/.."

cd "$PARENT"
for file in $(ls "$HERE"/example*.fonte | sort -V); do
  if [ -f "$file" ]; then
    runhaskell Main.hs < "$file"
    echo ""
  fi
done
