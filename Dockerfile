FROM  postgres:13-bullseye as postgres-13-bullseye-apb
LABEL maintainer="dockerdev@serinty.net"
LABEL org.opencontainers.image.created="2022-08-24"
LABEL org.opencontainers.image.source="https://github.com/Serinty/docker-postgres-backup.git"
LABEL org.opencontainers.image.vendor="Serinty Ltd"
LABEL org.opencontainers.image.authors="Sven Jorns"
LABEL org.opencontainers.image.licenses="Apache-2.0"
ENV POSTGRES_PASSWORD=postgres
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y bzip2 wget mailutils
RUN wget https://salsa.debian.org/kolter/autopostgresqlbackup/-/raw/unstable/debian/cron.daily -O /etc/cron.daily/autopostgresqlbackup.sh \
  && chmod +x /etc/cron.daily/autopostgresqlbackup.sh \
  && wget https://salsa.debian.org/kolter/autopostgresqlbackup/-/raw/unstable/debian/default -O /etc/default/autopostgresqlbackup \
  && wget https://raw.githubusercontent.com/k0lter/autopostgresqlbackup/master/autopostgresqlbackup -O /usr/sbin/autopostgresqlbackup \
  && chmod +x /usr/sbin/autopostgresqlbackup \
  && mkdir /var/lib/autopostgresqlbackup && chmod 777 /var/lib/autopostgresqlbackup
VOLUME /var/lib/autopostgresqlbackup

