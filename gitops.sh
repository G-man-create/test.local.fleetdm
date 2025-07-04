#!/bin/bash
set -e

echo "Authenticating with Fleet..."

fleetctl config set --address "$FLEET_URL"
fleetctl config set --token "$FLEET_API_TOKEN"

echo "Applying default.yml..."
fleetctl apply -f default.yml

# Применим все файлы в lib/, если есть
if [ -d "lib" ]; then
  find lib -type f -name "*.yml" -exec fleetctl apply -f {} \;
fi

echo "All configurations applied."
