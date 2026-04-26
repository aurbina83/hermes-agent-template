#!/bin/bash
set -e

# pan-ui's setup() skips the interactive wizard only if .env.local exists
# with content. Write whatever env vars Dokploy passed in so the file is
# populated and setup() returns immediately.
PANUI_ROOT="$(npm root -g)/@euraika-labs/pan-ui"

cat > "$PANUI_ROOT/.env.local" <<EOF
HERMES_HOME=${HERMES_HOME:-/opt/data/.hermes}
HERMES_API_BASE_URL=${HERMES_API_BASE_URL:-http://127.0.0.1:8642}
HERMES_API_KEY=${HERMES_API_KEY:-}
HERMES_WORKSPACE_USERNAME=${HERMES_WORKSPACE_USERNAME:-admin}
HERMES_WORKSPACE_PASSWORD=${HERMES_WORKSPACE_PASSWORD:-}
HERMES_WORKSPACE_SECRET=${HERMES_WORKSPACE_SECRET:-}
EOF

exec pan-ui start
