FROM debian:trixie-slim

WORKDIR /monitor

COPY . /monitor

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends bluez bluez-hcidump bc curl libmosquitto-dev libmosquitto1 mosquitto-clients && \
    rm -rf /var/lib/apt/lists/*

ENV PREF_CONFIG_DIR=/config \
    PREF_SERVICE_CHECK=false 

COPY entrypoint.sh /monitor/entrypoint.sh
COPY health.sh /usr/local/bin/health

CMD ["./entrypoint.sh"]
HEALTHCHECK CMD health