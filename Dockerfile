FROM ubuntu:16.04

WORKDIR /usr/src/app

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" \
        > /etc/apt/sources.list.d/pgdg.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCC4CF8 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        postgresql-client-9.6 \
        mysql-client \
        python-yaml \
        python-boto \
        && \
    rm -rf /var/lib/apt/lists/*

COPY dump.py ./

ENTRYPOINT [ "./dump.py" ]
