# temporal-docker

Coolify one-click service for [Temporal](https://temporal.io/) using PostgreSQL as the persistence backend.

## What's included

| Service | Image | Purpose |
|---------|-------|---------|
| `postgresql` | `postgres:16` | Persistence backend |
| `temporal-admin-tools` | `temporalio/admin-tools` | One-shot schema setup |
| `temporal` | `temporalio/server` | Workflow engine (gRPC :7233) |
| `temporal-create-namespace` | `temporalio/admin-tools` | One-shot namespace creation |
| `temporal-ui` | `temporalio/ui` | Web UI (proxied by Coolify) |

## Deploy on Coolify

1. In Coolify, go to **New Resource → Docker Compose**.
2. Point it at this repository (or paste the `docker-compose.yml` contents).
3. Coolify auto-generates the `SERVICE_*` magic variables — no manual secret entry needed.
4. Deploy. The UI will be accessible at the auto-generated FQDN.

## Connect your workers

```
TEMPORAL_ADDRESS=<coolify-server-ip>:7233
TEMPORAL_NAMESPACE=default
```

Port `7233` is exposed directly on the host for gRPC worker connections.

## Local development (plain Docker Compose)

```bash
cp .env.example .env
# Edit .env to set SERVICE_* variables manually, then:
docker compose up
```

UI will be at http://localhost:8080.

## Upgrading versions

Edit the version pins in `.env` (or Coolify environment variables):

```
TEMPORAL_VERSION=1.25.2
TEMPORAL_ADMINTOOLS_VERSION=1.25.2
TEMPORAL_UI_VERSION=2.31.2
POSTGRESQL_VERSION=16
```
