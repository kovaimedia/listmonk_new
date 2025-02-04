echo "
[app]
address = \"0.0.0.0:${PORT}\"
# Database.
[db]
host = \"${PGHOST}\"
port = ${PGPORT}
user = \"${PGUSER}\"
password = \"${PGPASSWORD}\"
database = \"${PGDATABASE}\"
ssl_mode = \"require\"
max_open = 25
max_idle = 25
max_lifetime = \"300s\"
" > config.toml
