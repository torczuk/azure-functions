#!/bin/bash
set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
readonly RESOURCE_GROUP="hackaton"

echo "verify arm vars ..."
test $ARM_CLIENT_SECRET || echo "ARM_CLIENT_SECRET missing"
test $ARM_CLIENT_ID || echo "ARM_CLIENT_ID missing"
test $ARM_TENANT_ID || echo "ARM_TENANT_ID missing"
test $ARM_SUBSCRIPTION_ID || echo "ARM_SUBSCRIPTION_ID missing"

echo "verify deployment vars ..."
test $APP_NAME || echo "APP_NAME missing"

az login --service-principal --username="$ARM_CLIENT_ID" --password="$ARM_CLIENT_SECRET" --tenant="$ARM_TENANT_ID"
az account set --subscription "$ARM_SUBSCRIPTION_ID"
az functionapp deployment source config-zip -g hackaton -n "$APP_NAME" --src dist.zip