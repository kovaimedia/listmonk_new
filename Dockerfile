FROM listmonk/listmonk:v4.1.0

ENV PORT=9000 \
    PGHOST=postgres \
    PGPORT=5432 \
    PGUSER=listmonk \
    PGPASSWORD=changeme \
    PGDATABASE=listmonk \
    DB_SSL_MODE=require \
    DB_MAX_OPEN=25 \
    DB_MAX_IDLE=25 \
    DB_MAX_LIFETIME=300s

COPY entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

EXPOSE ${PORT}
HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD wget -qO- "http://127.0.0.1:${PORT}/" >/dev/null 2>&1 || exit 1

ENTRYPOINT ["/docker-entrypoint.sh"]