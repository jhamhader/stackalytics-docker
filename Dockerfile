FROM ubuntu:latest

ENV STACKALYTICS_MEMCACHED_MEMORY=1024

RUN apt-get update && apt-get -y install \
    git \
    libpython2.7-dev \
    libssl-dev \
    memcached \
    nginx \
    openssl \
    python-pip \
    uwsgi \
    uwsgi-plugin-python

RUN useradd --home-dir /opt/stack --create-home --user-group --shell /bin/bash \
    stackalytics

USER stackalytics
WORKDIR /opt/stack
RUN git clone https://github.com/openstack/stackalytics.git \
    /opt/stack/stackalytics

USER root
RUN mkdir -p /var/local/stackalytics && chown stackalytics:stackalytics \
    /var/local/stackalytics
RUN cd /opt/stack/stackalytics && pip install --upgrade pip && pip install .

USER stackalytics

COPY scripts/start.sh /opt/stack
VOLUME /data

EXPOSE 8080
CMD ["./start.sh"]
