FROM listmonk/listmonk:latest
ARG PORT PGDATABASE PGHOST PGPASSWORD PGPORT PGUSER
COPY config.sh ./config.sh
RUN chmod +x ./config.sh && ./config.sh
RUN ./listmonk --idempotent --upgrade --yes
