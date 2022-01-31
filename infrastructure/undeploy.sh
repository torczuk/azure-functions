#!/bin/bash
set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "verify arm vars ..."
test $ARM_CLIENT_SECRET || echo "ARM_CLIENT_SECRET missing"
test $ARM_CLIENT_ID || echo "ARM_CLIENT_ID missing"
test $ARM_TENANT_ID || echo "ARM_TENANT_ID missing"
test $ARM_SUBSCRIPTION_ID || echo "ARM_SUBSCRIPTION_ID missing"

echo "verify terraform vars ... "
test $TF_VAR_func_name || echo "TF_VAR_func_name missing"

az login --service-principal --username="$ARM_CLIENT_ID" --password="$ARM_CLIENT_SECRET" --tenant="$ARM_TENANT_ID"
az account set --subscription "$ARM_SUBSCRIPTION_ID"
pushd $SCRIPT_DIR/terraform
terraform destroy
popd