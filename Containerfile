FROM registry.access.redhat.com/ubi9/go-toolset:1.24 AS builder

WORKDIR /opt/app-root/src

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN mkdir -p out && go build -buildvcs=false -o out/mosquitto-exporter .

FROM registry.access.redhat.com/ubi9/ubi-minimal:9.6

ARG BUILD_DATE="1970-01-01T00:00:00Z"
ARG VCS_REF="unknown"
ARG VERSION="dev"

LABEL org.opencontainers.image.title="mosquitto-exporter" \
      org.opencontainers.image.description="Prometheus metrics exporter for the Mosquitto message broker" \
      org.opencontainers.image.url="https://github.com/clcollins/mosquitto-exporter" \
      org.opencontainers.image.source="https://github.com/clcollins/mosquitto-exporter" \
      org.opencontainers.image.revision="${VCS_REF}" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.vendor="clcollins" \
      org.opencontainers.image.licenses="apache-2.0" \
      org.opencontainers.image.base.name="registry.access.redhat.com/ubi9/ubi-minimal:9.6" \
      is.collins.cluster.upstream.source="https://github.com/jryberg/mosquitto-exporter" \
      is.collins.cluster.upstream.vendor="jryberg" \
      io.k8s.display-name="mosquitto-exporter" \
      io.k8s.description="Prometheus metrics exporter for the Mosquitto message broker" \
      is.collins.cluster.image.revision="${VCS_REF}" \
      is.collins.cluster.image.version="${VERSION}" \
      is.collins.cluster.image.created="${BUILD_DATE}" \
      is.collins.cluster.build.commit.id="${VCS_REF}" \
      is.collins.cluster.build.date="${BUILD_DATE}"

COPY --from=builder /opt/app-root/src/out/mosquitto-exporter /mosquitto-exporter

USER 1001
EXPOSE 9234
ENTRYPOINT ["/mosquitto-exporter"]
