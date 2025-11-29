#!/usr/bin/env bash
set -eu
HERE="$(cd "$(dirname "$0")" && pwd)"
BIN="$HERE/../hc"
TESTFILE="$HERE/tests.txt"

while IFS= read -r line || [ -n "$line" ]; do
  # strip comments and trim whitespace
  line="${line%%#*}"
  line="$(echo "$line" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  [ -z "$line" ] && continue

  # if the line contains => treat left side as the input expression
  if [[ "$line" == *'=>'* ]]; then
    input="${line%%=>*}"
  else
    input="$line"
  fi
  # trim whitespace from input
  input="$(echo "$input" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  out=$(printf "%s" "$input" | "$BIN")
  printf "%s => %s\n" "$input" "$out"
done < "$TESTFILE"
