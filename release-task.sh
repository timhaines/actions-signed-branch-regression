#!/usr/bin/env bash
set -euo pipefail

expected=968b6c8af516e06dae75f83693a963cf502573323bc1137e4752be898cfae854
actual=$(printf '%s' "$RELEASE_SYNTHETIC_SECRET" | sha256sum | cut -d' ' -f1)
test "$actual" = "$expected"
test -n "$ACTIONS_ID_TOKEN_REQUEST_TOKEN"
printf 'RELEASE_CONTROL trusted task received the synthetic release secret and OIDC request capability\n'
