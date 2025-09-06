FROM debian:trixie-slim

WORKDIR /monitor

COPY . /monitor

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends bluez bluez-hcidump bc libmosquitto-dev libmosquitto1 mosquitto-clients && \
    rm -rf /var/lib/apt/lists/*

ENV PREF_CONFIG_DIR=/config \
    PREF_SERVICE_CHECK=false 

CMD ["/monitor/monitor.sh", "-b", "-w", "-D", "/config"]
