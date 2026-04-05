FROM debian:stable-slim

ARG LIGHTPANDA_URL=https://github.com/lightpanda-io/browser/releases/download/nightly/lightpanda-x86_64-linux

RUN apt-get update -yq && \
    apt-get install -yq --no-install-recommends ca-certificates curl tini && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL "$LIGHTPANDA_URL" -o /usr/local/bin/lightpanda && \
    chmod +x /usr/local/bin/lightpanda

COPY deploy/render/start-lightpanda.sh /usr/local/bin/start-lightpanda.sh
RUN chmod +x /usr/local/bin/start-lightpanda.sh

ENV LIGHTPANDA_DISABLE_TELEMETRY=true

EXPOSE 10000

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/usr/local/bin/start-lightpanda.sh"]
