#!/bin/sh
set -e

TEMPORAL_ADDRESS=${TEMPORAL_ADDRESS:-temporal:7233}
DEFAULT_NAMESPACE=${DEFAULT_NAMESPACE:-default}

echo "Creating namespace: ${DEFAULT_NAMESPACE} at ${TEMPORAL_ADDRESS}"
temporal operator namespace create \
  --namespace "${DEFAULT_NAMESPACE}" \
  --address "${TEMPORAL_ADDRESS}" || true

echo "Namespace setup complete."
