#!/usr/bin/env sh
set -e

CONFIG_PATH="/etc/listmonk"
mkdir -p "$CONFIG_PATH"

: "${PORT:=9000}"
: "${PGHOST:?Need PGHOST}"
: "${PGPORT:?Need PGPORT}"
: "${PGUSER:?Need PGUSER}"
: "${PGPASSWORD:?Need PGPASSWORD}"
: "${PGDATABASE:?Need PGDATABASE}"
: "${DB_SSL_MODE:=require}"
: "${DB_MAX_OPEN:=45}"
: "${DB_MAX_IDLE:=15}"
: "${DB_MAX_LIFETIME:=300s}"

cat > "${CONFIG_PATH}/config.toml" <<EOF
[app]
address = "0.0.0.0:${PORT}"

[db]
host = "${PGHOST}"
port = ${PGPORT}
user = "${PGUSER}"
password = "${PGPASSWORD}"
database = "${PGDATABASE}"
ssl_mode = "${DB_SSL_MODE}"
max_open = ${DB_MAX_OPEN}
max_idle = ${DB_MAX_IDLE}
max_lifetime = "${DB_MAX_LIFETIME}"
EOF

./listmonk --config "${CONFIG_PATH}/config.toml" --idempotent --upgrade --yes
exec ./listmonk --config "${CONFIG_PATH}/config.toml"