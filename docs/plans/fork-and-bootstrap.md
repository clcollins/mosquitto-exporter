# Fork and Bootstrap — mosquitto-exporter

**Status:** In Progress
**Created:** 2026-06-23

## Summary

Fork [jryberg/mosquitto-exporter](https://github.com/jryberg/mosquitto-exporter)
(itself a fork of [sapcc/mosquitto-exporter](https://github.com/sapcc/mosquitto-exporter))
and bootstrap with personal project standards.

## What Was Done

- Forked `jryberg/mosquitto-exporter` to `clcollins/mosquitto-exporter`
- Created Quay.io repository `quay.io/clcollins/mosquitto-exporter`
- Created robot account `clcollins+mosquitto_exporter` with write permission
- Set GitHub Actions secrets: `QUAY_REPOSITORY`, `QUAY_ROBOT_USERNAME`, `QUAY_ROBOT_TOKEN`
- Replaced upstream build files (renamed to `*.upstream`):
  - `Makefile` — new version with containerized CI, Go lint/vet/test, multi-arch image build
  - `Dockerfile` — new `Containerfile` using UBI9-minimal base
  - `.github/workflows/release.yaml` — replaced with `ci.yaml` and `image-build-push.yaml`
- Added project files: `CLAUDE.md`, `AGENTS.md`, `.golangci.yml`, `.yamllint.yaml`,
  `.markdownlint.yaml`, `.containerignore`
- Updated README with upstream credit section

## Language

Go 1.24 (detected and confirmed via `go.mod`)

## Upstream

- **Direct parent:** [jryberg/mosquitto-exporter](https://github.com/jryberg/mosquitto-exporter)
  (Go 1.24, v0.7.7, last active June 2026)
- **Original:** [sapcc/mosquitto-exporter](https://github.com/sapcc/mosquitto-exporter)
  (Go 1.14, v0.8.0, effectively unmaintained since Oct 2021)
