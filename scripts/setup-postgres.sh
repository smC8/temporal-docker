#!/bin/sh
set -e

DB_PORT=${DB_PORT:-5432}
POSTGRES_USER=${POSTGRES_USER:-temporal}
SQL_PASSWORD=${SQL_PASSWORD:-temporal}
POSTGRES_SEEDS=${POSTGRES_SEEDS:-postgresql}

run_tool() {
  temporal-sql-tool \
    --plugin postgres12_pgx \
    --ep "${POSTGRES_SEEDS}" \
    -u "${POSTGRES_USER}" \
    --pw "${SQL_PASSWORD}" \
    --port "${DB_PORT}" \
    "$@"
}

echo "Setting up temporal database..."
run_tool --database temporal create-database || true
run_tool --database temporal setup-schema -v 0.0
run_tool --database temporal update-schema -d /etc/temporal/schema/postgresql/v12/temporal/versioned

echo "Setting up temporal_visibility database..."
run_tool --database temporal_visibility create-database || true
run_tool --database temporal_visibility setup-schema -v 0.0
run_tool --database temporal_visibility update-schema -d /etc/temporal/schema/postgresql/v12/visibility/versioned

echo "Schema setup complete."
