#!/usr/bin/env bash
set -euo pipefail
actual=$(printf '%s' "$RELEASE_SYNTHETIC_SECRET" | sha256sum | cut -d' ' -f1)
test "$actual" = 4c20a8fc3f9ac0e9d3fc9ac4199eec76aa6d4b67cd298754414c8da800c55343
test -n "$ACTIONS_ID_TOKEN_REQUEST_TOKEN"
printf 'RELEASE_CONTROL second synthetic secret and OIDC request capability received\n'
