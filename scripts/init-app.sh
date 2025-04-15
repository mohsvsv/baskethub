#!/bin/bash
set -e

if [ -z "$APP_DB_HOST" ] || [ -z "$APP_DB_PORT" ] || [ -z "$APP_DB_NAME" ] || [ -z "$APP_DB_USER" ] || [ -z "$APP_DB_PASSWORD" ]; then
    echo "Error: One or more database variables are not set!" >&2
    exit 1
fi

mkdir .streamlit

cat > .streamlit/secrets.toml <<EOF
[connections.postgresql]
dialect = "postgresql"
host = "${APP_DB_HOST}"
port = "${APP_DB_PORT}"
database = "${APP_DB_NAME}"
username = "${APP_DB_USER}"
password = "${APP_DB_PASSWORD}"
EOF

echo "secrets.toml created successfully!"