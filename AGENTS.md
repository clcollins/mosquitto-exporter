# AGENTS.md — mosquitto-exporter

Fork of [jryberg/mosquitto-exporter](https://github.com/jryberg/mosquitto-exporter)
(itself a fork of [sapcc/mosquitto-exporter](https://github.com/sapcc/mosquitto-exporter)).

Prometheus exporter for Mosquitto MQTT broker `$SYS/#` topics. Go binary, listens
on `:9234`.

## Build

```bash
make build          # Build binary to /tmp/
make image-build    # Build multi-arch container image
make ci-all         # Run all CI checks (lint, vet, test, container build)
```

## Project Structure

- `main.go` — CLI entry point, MQTT subscription, HTTP metrics server
- `handlers.go` — HTTP handler for version endpoint
- `mosquitto_counter.go` — Custom Prometheus collector for counter-type `$SYS` metrics
- `version.go` — Build version injection

## Conventions

- Container images published to `quay.io/clcollins/mosquitto-exporter`
- Multi-arch: linux/amd64 + linux/arm64
- Apache 2.0 license (inherited from upstream)
- Go module path: `github.com/sapcc/mosquitto-exporter` (inherited, not changed)
