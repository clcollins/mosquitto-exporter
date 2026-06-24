# mosquitto-exporter

Prometheus exporter for the [Mosquitto MQTT message broker](https://mosquitto.org/).
Subscribes to `$SYS/#` topics and exposes broker metrics (connected clients,
messages/sec, bytes in/out, heap usage) on `:9234` for Prometheus scraping.

## Container Image

```bash
podman run -p 9234:9234 quay.io/clcollins/mosquitto-exporter:latest \
  --endpoint tcp://mosquitto:1883
```

Multi-arch images (amd64 + arm64) are published to
`quay.io/clcollins/mosquitto-exporter` on every push to `main`.

## Usage

```text
NAME:
   mosquitto-exporter - Prometheus exporter for broker metrics

USAGE:
   mosquitto-exporter [global options] command [command options] [arguments...]

GLOBAL OPTIONS:
   --endpoint value, -e value      Endpoint for the Mosquitto message broker
                                   (default: "tcp://127.0.0.1:1883") [$BROKER_ENDPOINT]
   --bind-address value, -b value  Listen address for metrics HTTP endpoint
                                   (default: "0.0.0.0:9234") [$BIND_ADDRESS]
   --user value, -u value          Username [$MQTT_USER]
   --pass value, -p value          Password [$MQTT_PASS]
   --cert value, -c value          TLS certificate .pem file [$MQTT_CERT]
   --key value, -k value           TLS private key .pem file [$MQTT_KEY]
   --client-id value, -i value     MQTT client id [$MQTT_CLIENT_ID]
   --reset-metrics, -r             Reset metrics on broker disconnect (default: true)
                                   [$RESET_METRICS]
   --help, -h                      show help
   --version, -v                   print the version
```

## Upstream

This repository is a fork of
[jryberg/mosquitto-exporter](https://github.com/jryberg/mosquitto-exporter),
which is itself a fork of the original
[sapcc/mosquitto-exporter](https://github.com/sapcc/mosquitto-exporter) by SAP.

Changes from upstream:

- Multi-arch container images (amd64 + arm64) published to
  `quay.io/clcollins/mosquitto-exporter`
- Containerized CI/CD pipeline using podman
- UBI9-minimal base image

## License

[Apache License 2.0](LICENSE) — inherited from upstream.
