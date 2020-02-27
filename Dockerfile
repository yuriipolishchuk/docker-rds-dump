FROM ubuntu:18.04

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y gnupg2 && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" \
        > /etc/apt/sources.list.d/pgdg.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FCC7D46ACCC4CF8 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        postgresql-client-11 \
        mysql-client \
        python-yaml \
        python-boto \
        && \
    rm -rf /var/lib/apt/lists/*

COPY dump.py ./

CMD ["python", "-u", "/usr/src/app/dump.py"]
