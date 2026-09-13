#!/usr/bin/env bash
set -euo pipefail

expected=85dc8c4be789db75ecc373cbb44d248ef701bd717e1919a29b827002aad33119
actual=$(printf '%s' "$SYNTHETIC_REPO_SECRET" | sha256sum | cut -d' ' -f1)
test "$actual" = "$expected"
printf 'CONTROL trusted task received the synthetic secret; no marker was pushed\n'
