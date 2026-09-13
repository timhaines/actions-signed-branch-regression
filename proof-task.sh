#!/usr/bin/env bash
set -euo pipefail
actual=$(printf '%s' "$SYNTHETIC_REPO_SECRET" | sha256sum | cut -d' ' -f1)
test "$actual" = 6354534e0b1ee51a535b3436a3f9f765ebcb2b0c1e4b7ba6a5d7c618b316e69f
printf 'CONTROL first synthetic secret received\n'
